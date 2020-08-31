<template>
    <div class="background">
        <div class="background-container"></div>
    </div>

    <div class="appbar">
        <h1 class="appname">SNS Max</h1>
        <div class="links">
            <a href="https://bytegem.org/">Byte Gem</a>
            <a href="https://github.com/bytegem/fans" target="_blank" rel="noopener noreferrer">Fans Project</a>
        </div>
    </div>

    <div class="container">
        <div>
            <h1 class="title">精致的思考，值得分享！看看身边有多少有趣的灵魂</h1>
            <p class="subtitle">SNS Max 是一个有趣的社交程序，以动态为核心。用户分享自己的身边动态。首页可以按照最新全站动态进行排序查看，还可以看附近的人都在分享什么。</p>
            <p class="subtitle">现在下载 SNS Max 体验程序试试吧</p>

            <div class="download">
                <a href="https://testflight.apple.com/join/wkahVf0E" class="download-button">
                    <img class="button-icon" src="../assets/ios.svg">
                    <div class="button-text">
                        Download app for
                        <span>iOS</span>
                    </div>
                </a>
                <a href="#" class="download-button" @click="downloadAndroid">
                    <img class="button-icon android-icon" src="../assets/android.svg">
                    <div class="button-text" v-if="download == 1">正在获取下载地址...</div>
                    <div class="button-text" v-else>
                        Download app for
                        <span>Android</span>
                    </div>
                </a>
            </div>
        </div>
        <div>
            <slot />
        </div>
    </div>

    <div class="footer">
        <div>
            <div class="footer-code">&lt;Byte Gem/&gt;</div>
            <div class="footer-bytegem-text">四川字节琳琅科技有限公司</div>
        </div>
        <div class="links">
            <a href="mailto:service@bytegem.net">service@bytegem.net</a>
            <a href="https://github.com/bytegem" target="_blank" rel="noopener noreferrer">Terms</a>
        </div>
    </div>

</template>

<script>
export default {
    data: () => ({
        download: 0,
    }),
    methods: {
        downloadAndroid() {
            if (this.download == 1) {
                return;
            }
            this.download = 1;
            fetch('https://snsmax.bytegem.net/api2/android-version')
                .then(response => response.json())
                .then(result => result.data)
                .then(result => result.apk)
                .then(url => {
                    this.download = 0;
                    open(url);
                }).catch(() => {
                    alert('获取安装包失败');
                    this.download = 0;
                });
        }
    }
}
</script>

<style scoped>
.background {
    position: absolute;
    width: 100%;
    height: 100%;
    overflow: hidden;
    top: 0;
}
.background .background-container {
    position: absolute;
    z-index: 0;
    width: 1200px;
    height: 1200px;
    margin-left: -600px;
    top: -450px;
    left: 50%;
    transform: translate3d(-50%, 0, 0);
    background: #5E6CE7;
    border-radius: 50%;
}
.appbar {
    position: absolute;
    widows: 100%;
    max-width: 1336px;
    z-index: 2;
    padding: 0 48px;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 24px;
    display: flex;
    flex-direction: row;
    align-items: center;
}
.appbar .appname {
    color: #fff;
    font-size: 2.4rem;
    font-weight: 700;
    flex-shrink: 0;
}
.appbar .links {
    width: 100%;
    text-align: right;
}
.appbar .links > * {
    text-decoration: none;
    color: #000;
    font-size: 1.6rem;
    font-weight: 600;
    margin-left: 24px;
}

.container {
    position: relative;
    z-index: 4;
    width: 100%;
    display: flex;
    padding: 0 48px;
    margin-top: 120px;
}
.container > * {
    width: 50%;
}
.title {
    color: #fff;
    width: 100%;
    text-align: center;
    font-size: 3.4rem;
    max-width: 440px;
    font-weight: 400;
    margin-top: 0;
}
.subtitle {
    color: #fff;
    font-weight: 300;
    font-size: 1.8rem;
    text-align: center;
    width: 100%;
    box-sizing: border-box;
    max-width: 440px;
    opacity: 0.6;
}
.download-button {
    background: #000;
    position: relative;
    display: inline-flex;
    border-radius: 64px;
    width: 220px;
    height: 64px;
    align-items: center;
    color: #fff;
    text-decoration: none;
}
.download-button > .button-icon {
    width: 64px;
    height: 64px;
    flex-shrink: 0;
}
.download-button > .button-icon.android-icon {
    width: 32px;
    margin-left: 18px;
}
.download-button > .button-text {
    width: 100%;
    margin-right: 24px;
    text-align: center;
    font-size: 1rem;
}
.download-button > .button-text span {
    display: block;
    font-size: 1.8rem;
}
.download {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    max-width: 480px;
}
.download .download-button {
    margin-top: 24px;
}
.footer {
    width: 100%;
    background: #2d3039;
    position: relative;
    z-index: 1;
    color: #fff;
    padding: 26px 50px;
    margin-top: 120px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}
.footer .footer-bytegem-text {
    font-size: 1.6rem;
    color: #7d869e;
    font-weight: 200;
}
.footer .footer-code {
    font-size: 2.4rem;
    font-weight: lighter;
    padding-bottom: 12px;
}
.footer .links > * {
    color: #7d869e;
    font-size: 1.6rem;
    font-weight: 200;
    margin: 8px 0;
    text-decoration: none;
    margin-left: 32px;
}
</style>

<style scoped>
@media (max-width: 1024px) {
    .background {
        overflow: hidden;
    }
    .background .background-container {
        top: -650px;
        left: 50%;
        width: 1600px;
        min-width: 1600px;
        margin-left: auto;
    }
    .container {
        flex-direction: column;
        padding: 0;
    }
    .container > * {
        width: 100%;
    }
    .title {
        padding: 0 48px;
        max-width: none;
    }
    .subtitle {
        max-width: none;
        padding: 0 36px;
    }
    .download {
        flex-direction: column;
        align-items: center;
        max-width: none;
    }
    .footer {
        flex-direction: column;
    }
    .footer .links > * {
        display: block;
        margin-left: 0;
        width: 100%;
        text-align: center;
    }
    .footer .footer-bytegem-text,
    .footer .footer-code {
        text-align: center;
    }
}
@media (max-width: 400px) {
    .appbar .appname {
        width: 100%;
        text-align: center;
    }
    .appbar .links {
        display: none;
    }
}
</style>