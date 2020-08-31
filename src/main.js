import { createApp } from 'vue'
import App from './App.vue'
import { router } from './router';
import { useJMLinkMethodMixin } from './mixins/jml';

const app = createApp(App);
app.mixin(useJMLinkMethodMixin);
app.use(router)
app.mount('#app');
