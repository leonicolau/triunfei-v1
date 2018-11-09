// Vue libs
import Vue from 'vue/dist/vue';
import VueResource from 'vue-resource';
import TurbolinksAdapter from  'vue-turbolinks'
import ToggleTimer from './components/ToggleTimer'
import ToggleText from './components/ToggleText/'
import TimerRedirect from './components/TimerRedirect'
import Wizard from './containers/Wizard'
import RegisterService from './utils/RegisterService'

// Vue config
Vue.use(TurbolinksAdapter);
Vue.use(VueResource);

RegisterService.register('ToggleTimer', ToggleTimer, 'toggle-timer');
RegisterService.register('ToggleText', ToggleText, 'toggle-text');
RegisterService.register('TimerRedirect', TimerRedirect, 'timer-redirect');
RegisterService.register('Wizard', Wizard, 'wizard');
