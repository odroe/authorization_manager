<template>
  <layout v-if="useLayout">
    <router-view v-if="hasHome" />
    <div class="phone mx-auto relative" v-else>
      <img src="./assets/iphone.svg" class="absolute z-0 w-full h-full">
      <div class="z-10 absolute box">
        <router-view />
      </div>
    </div>
  </layout>
  <mobile v-else>
    <router-view />
  </mobile>
</template>

<script>
import { defineAsyncComponent } from 'vue';
const layout = defineAsyncComponent(() => import('./components/Layout.vue'));
const mobile = defineAsyncComponent(() => import('./components/MobileLayout.vue'));

export default {
  components: { 
    layout,
    mobile,
  },
  computed: {
    clientWidget() {
      return document.body.clientWidth;
    },
    hasHome() {
      return this.$route.name == 'home';
    },
    useLayout() {
      if (this.hasHome) {
        return true;
      }

      return this.clientWidget > 1024;
    },
  },
}
</script>

<style scoped>
.phone {
  width: 49.3261455526vh;
  height: 100vh;
  margin-top: -14%;
  z-index: 0;
}
.phone .box {
  position: absolute;
  top: 10.8%;
  left: 5.5%;
  right: 5.4%;
  bottom: 11%;
  box-sizing: border-box;
  overflow: hidden;
  overflow-y: scroll;
}
.phone .box::-webkit-scrollbar {
  background-color: transparent;
  width: 4px;
  background-clip: padding-box;
}
.phone .box::-webkit-scrollbar-thumb {
  background-color: theme('colors.gray.400');
  border-radius: 4px;
}
</style>
