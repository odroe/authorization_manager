<template>
  <layout v-if="useLayout">
    <router-view />
  </layout>
  <mobile v-else>
    <router-view />
  </mobile>
</template>

<script>
import Layout from './components/Layout.vue';
import Mobile from './components/MobileLayout.vue';
export default {
  components: { 
    Layout,
    Mobile
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

<style>
html, body {
  margin: 0;
  padding: 0;
  font-family: "Open Sans", sans-serif;
}
* {
  box-sizing: border-box;
}
html {
  font-size: 62.5%;
}
</style>
