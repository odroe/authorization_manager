<template>
    <div class="min-h-screen">
        <div class="background">
            <div class="background-container"></div>
        </div>
        
        <!-- 导航 -->
        <nav class="flex items-center justify-between flex-wrap p-6 z-10 relative">
            <div class="flex items-center flex-shrink-0 text-white mr-6">
                <img src="../assets/logo.png" class="fill-current h-8 w-8 mr-2 rounded-full">
                <span class="font-semibold text-xl tracking-tight">SNS Max</span>
            </div>
            <div class="block sm:hidden">
                <button class="flex items-center px-3 py-2 border rounded lg:text-black text-white lg:border-black border-white lg:hover:text-gray-700 hover:border-gray-200" @click="menuHandler">
                    <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>Menu</title><path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/></svg>
                </button>
            </div>
            <div class="w-full flex-grow sm:flex sm:items-center sm:w-auto hidden">
                <div class="text-sm flex-grow flex justify-end">
                    <a href="https://bytegem.net/" class="block inline-block mt-0 text-black hover:text-gray-700 mr-4 font-bold">
                        Byte Gem
                    </a>
                    <a href="https://bytegem.net/products/fans/" target="_blank" rel="noopener noreferrer" class="block inline-block mt-0 text-black hover:text-gray-700 mr-4 font-bold">
                        Fans Project
                    </a>
                </div>
            </div>
            <div class="w-full block flex-grow" v-show="showMenu">
                <div class="text-sm">
                    <a href="https://bytegem.org/" class="block mt-4  text-white hover:text-gray-200 mr-4 font-bold">
                        Byte Gem
                    </a>
                    <a href="https://bytegem.net/products/fans/" target="_blank" rel="noopener noreferrer" class="block mt-4 text-white hover:text-gray-200 mr-4 font-bold">
                        Fans Project
                    </a>
                </div>
            </div>
        </nav>

        <!-- 根容器 -->
        <div class="flex flex-col lg:flex-row lg:items-center">
            <div class="w-full">
                <!-- 标题 -->
                <h1 class="text-4xl text-white text-center px-6 lg:px-20">精致的思考，值得分享！看看身边有多少有趣的灵魂</h1>

                <!-- 副标题 -->
                <p class="text-base text-gray-300 text-center px-6 lg:px-20 pt-6 lh:pt-20">SNS Max 是一个有趣的社交程序，以动态为核心。用户分享自己的身边动态。首页可以按照最新全站动态进行排序查看，还可以看附近的人都在分享什么。</p>

                <!-- 副标题2 -->
                <p class="text-base text-gray-300 text-center px-6 lg:px-20 pt-6 lh:pt-20">现在下载 SNS Max 体验程序试试吧</p>

                <!-- 下载按钮 -->
                <div class="flex flex-col sm:flex-row justify-center items-center pt-12">
                    <a class="inline-flex bg-black text-white w-64 sm:w-48 rounded-full h-16 items-center shadow-md" href="https://testflight.apple.com/join/wkahVf0E">
                        <img class="w-12 h-12 flex-shrink-0" src="../assets/ios.svg">
                        <div class="text-white text-xs text-center w-full leading-4 mr-6">
                            Download app for
                            <span class="text-xl block">iOS</span>
                        </div>
                    </a>
                    <div class="h-8"></div>
                    <div class="inline-flex bg-black text-white w-64 sm:w-48 rounded-full h-16 sm:ml-6 h-12 items-center shadow-md cursor-pointer" @click="downloadAndroid">
                        <img class="w-6 h-6 mx-3 flex-shrink-0" src="../assets/android.svg">
                        <div class="text-white text-xs text-center w-full leading-4 mr-6" v-if="download == 1">
                            正在获取下载地址...
                        </div>
                        <div class="text-white text-xs text-center w-full leading-4 mr-6" v-else>
                            Download app for
                            <span class="text-xl block">Android</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-full">
                <slot />
            </div>
        </div>
    </div>

    <footer class="w-full py-4 px-12 bg-gray-900 flex flex-col sm:flex-row justify-between items-center mt-12 lg:mt-0">
        <div>
            <div class="text-white text-3xl font-light text-center">&lt;Byte Gem/&gt;</div>
            <div class="text-gray-600 text-lg text-center">四川字节琳琅科技有限公司</div>
        </div>
        <div class="flex flex-col justify-between sm:block">
            <a class="text-gray-500 text-center" href="mailto:service@bytegem.net">service@bytegem.net</a>
            <a class="text-gray-500 mt-2 sm:mt-0 sm:ml-4 text-center" href="https://github.com/bytegem" target="_blank" rel="noopener noreferrer">Terms</a>
        </div>
    </footer>
</template>

<script>
export default {
    data: () => ({
        download: 0,
        showMenu: false,
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
        },
        menuHandler() {
            this.showMenu = !this.showMenu;
        }
    }
}
</script>

<style>
.background {
    position: absolute;
    width: 100%;
    height: 100%;
    overflow: hidden;
    top: 0;
    z-index: -1;
}
.background .background-container {
    position: relative;
    width: 1200px;
    height: 1200px;
    margin-left: -600px;
    top: -450px;
    left: 50%;
    transform: translate3d(-50%, 0, 0);
    background: #5E6CE7;
    border-radius: 50%;
}
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
}
</style>