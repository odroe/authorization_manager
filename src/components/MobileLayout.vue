<template>
    <div>
        <div class="appbar">
        <img class="logo" src="../assets/logo.png" alt="SNS Max">
        <div class="slogan">发现有趣的灵魂</div>
        <div class="openApp" ref="openApp">打开APP</div>
    </div>
    <slot />
    </div>
</template>

<style scoped>
.appbar {
    width: 100%;
    height: 64px;
    display: flex;
    background: #5E6CE7;
    align-items: center;
    padding: 0 12px;
}
.appbar .logo {
    width: 36px;
    height: 36px;
    border-radius: 100%;
    flex-shrink: 0;
}
.appbar .slogan {
    width: 100%;
    color: #fff;
    padding: 0 12px;
    font-weight: 600;
}
.appbar .openApp {
    flex-shrink: 0;
    background: #fff;
    color: #5E6CE7;
    padding: 8px 16px;
    border-radius: 24px;
    font-weight: bold;
    text-decoration: none;
    cursor: pointer;
}
</style>

<script>
export default {
    computed: {
        jml: () => 'openApp',
    },
}
</script>