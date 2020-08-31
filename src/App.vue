<template>
  <layout v-if="useLayout">
    <router-view />
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
