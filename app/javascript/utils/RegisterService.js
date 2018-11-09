import Vue from 'vue/dist/vue';
import jQuery from 'jquery';

export default class RegisterService {
  static register(name, component, selector) {
    document.addEventListener('turbolinks:load', () => {
      if (jQuery(selector).length == 0) { return; }
      new Vue({
        el: selector,
        components: { [name]: component, }
      })
    })
  }
}
