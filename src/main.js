import { createApp } from 'vue'
import App from './App.vue'
import { router } from './router';
import { useJMLinkMethodMixin } from './mixins/jml';

import './base.css';

// create app
const app = createApp(App);

app.use(router)
app.mixin(useJMLinkMethodMixin);

// Route is ready run app.
router.isReady().then(() => app.mount('#app'));
