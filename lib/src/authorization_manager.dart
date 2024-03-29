import 'dart:async';
import 'dart:math';

import 'authorization.dart';
import 'authorization_type.dart';

typedef AuthorizationReader = FutureOr<Authorization?> Function(
    AuthorizationType);
typedef AuthorizationWriter = FutureOr<void> Function(Authorization);
typedef AuthorizationRefresher = FutureOr<void> Function(AuthorizationManager);
typedef AuthorizationClear = FutureOr<void> Function(AuthorizationManager);

class AuthorizationManager {
  AuthorizationManager({
    required this.reader,
    required this.writer,
    this.refresher,
    AuthorizationClear? clear,
  }) : _clear = clear;

  final AuthorizationReader reader;
  final AuthorizationWriter writer;
  final AuthorizationClear? _clear;
  final AuthorizationRefresher? refresher;
  Timer? _timer;

  FutureOr<Authorization?> getAccessToken() => reader(AuthorizationType.access);
  FutureOr<Authorization?> getRefreshToken() =>
      reader(AuthorizationType.refresh);

  Future<void> init() => _createTimer(true);

  Future<void> store(Authorization authorization) async {
    await writer(authorization);
    if (authorization.type == AuthorizationType.access) {
      _createTimer();
    }
  }

  Future<void> clear() async {
    await _clear?.call(this);
    _timer?.cancel();
  }

  Future<void>? refresh() async => await refresher?.call(this);

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _createTimer([bool first = false]) async {
    final accessToken = await getAccessToken();
    final diff = accessToken?.expiredAt.difference(DateTime.now());
    final int inMinutes = diff?.inMinutes ?? 0;

    if (first || inMinutes <= 5) {
      return await refresh();
    }

    _timer?.cancel();
    _timer = Timer(Duration(minutes: max(5, inMinutes - 5)), refresh);
  }
}
