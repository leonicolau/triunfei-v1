import Vue from 'vue/dist/vue';

export default class WizardFieldService {
  query(params) {
    return Vue.http.get('/api/wizard_fields', { params });
  }
}
