<template>
    <div ref="openApp">
        <div v-if="feed">
        <!-- 用户信息 -->
        <div class="w-full px-2 py-2 bg-white flex flex-row items-center">
            <img :src="user.avatar_url" class="w-12 h-12 rounded-full flex-shrink-0">
            <h3 class="w-full ml-4 font-medium text-lg">{{ user.name || user.hashids }}</h3>
            <button class="flex-shrink-0 bg-primary text-white py-1 px-3 rounded-full text-xs">+ 关注</button>
        </div>

        <!-- 帖子内容文本 -->
        <div class="bg-white px-2 text-gray-800" v-if="feed.contents">
            <span class="text-green-500" v-if="feed.topic">#{{ feed.topic.name }}#</span>
            {{ feed.contents }}
        </div>

        <!-- 图片内容 -->
        <div class="grid grid-cols-3 bg-white gap-4 px-2 pt-2" v-if="feed.images">
            <div class="col-span-1" v-for="image in feed.images" :key="image">
                <div class="w-full h-0 relative overflow-hidden" style="padding-top:100%;">
                    <img :src="image" class="absolute top-0 left-0 right-0 bottom-0 object-cover w-full h-full rounded-lg">
                </div>
            </div>
        </div>

        <!-- 视频 -->
        <div class="bg-white video w-full" v-if="feed.video">
            <div class="w-full h-full absolute px-2 pt-2 overflow-hidden z-0">
                <img :src="feed.video.cover" class="w-full h-full rounded-lg object-cover z-0">
            </div>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="z-10 w-12 h-12 text-black absolute" style="bottom: 24px; left: 24px">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" clip-rule="evenodd" />
            </svg>
        </div>

        <!-- 时间 -->
        <div class="bg-white px-2 py-4 text-xs">
            发布于：{{ feed.created_at }}
        </div>

        <!-- 数据栏 -->
        <div class="bg-white flex flex-row justify-between pb-2">
            <div class="w-full flex flex-row justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-6 h-6 mr-1">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                </svg>
                <span>{{ feed.likes_count }}</span>
            </div>
            <div class="w-full flex flex-row justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-6 h-6 mr-1">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
                </svg>
                <span>{{ feed.comments_count }}</span>
            </div>
            <div class="w-full flex flex-row justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-6 h-6 mr-1">
                <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                </svg>
                <span>分享</span>
            </div>
        </div>

        <!-- 分割栏 -->
        <div class="h-6 w-full bg-gray-100"></div>

        <!-- 评论标题 -->
        <div class="w-full bg-white p-2 text-sm font-medium" v-show="comments.length">最新评论</div>
        <div class="h-1 w-full bg-gray-200" v-show="comments.length"></div>

        <!-- 评论 -->
        <div class="bg-white p-2" v-for="comment in comments" :key="comment.id">
            <div class="flex flex-row items-center">
                <img :src="comment.user.avatar_url" class="w-10 h-10 rounded-full flex-shrink-0">
                <div class="ml-2 w-full">
                    <div class="text-base font-medium">{{ comment.user.name || comment.user.hashids }}</div>
                    <div class="text-xs">{{ comment.created_at }}</div>
                </div>
                <div class="flex flex-row justify-center mr-2">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-6 h-6 mr-1">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                    </svg>
                    <span>{{ comment.likes_count }}</span>
                </div>
            </div>
            <div class="ml-12">{{ comment.contents }}</div>
        </div>

        <!-- 打开 App 按钮 -->
        <button class="bg-primary text-white py-2 px-8 rounded-full my-8 text-lg shadow-lg" style="position: relative;
        left: 50%;
        transform: translateX(-50%);">打开 App</button>

        </div>
    </div>
</template>

<style scoped>
.video {
    /* height: 0; */
    padding-bottom: 56.25%;
    position: relative;
}
</style>

<script>
export default {
    computed: {
        id() {
            const { id } = this.$route.params;
            return id;
        },
        user() {
            return this.feed.user;
        },
        jml() {
            return 'openApp'
        }
    },
    data: () => ({
        feed: null,
        comments: []
    }),
    mounted() {
        fetch(`https://snsmax.bytegem.net/api2/feeds/${this.id}`)
            .then(response => response.json())
            .then(result => result.data)
            .then(data => {
                this.feed = data;
            })
            .catch(() => {
                alert('获取数据失败');
            });
        fetch(`https://snsmax.bytegem.net/api2/feeds/${this.id}/comments`)
            .then(response => response.json())
            .then(result => result.data)
            .then(data => {
                this.comments = data;
            })
    }
}
</script>
