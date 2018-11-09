/* eslint-disable no-undef */
import Vue from 'vue';
import WizardStep from './index.vue';
import WizardFieldService from '../../../services/WizardFieldService';

describe('WizardStep.vue', () => {
  describe('mounted', () => {
    it('uses WizardFieldService to query fields', () => {
      const Constructor = Vue.extend(WizardStep);
      const thenMock = jest.fn();
      jest.spyOn(WizardFieldService.prototype, 'query').mockReturnValue({ then: thenMock });
      new Constructor({ propsData: { step: 'my step', wizardId: 'my wizard id' } }).$mount();

      expect(WizardFieldService.prototype.query).toBeCalled();
    });

    it('assigns api data body to fields', () => {
      const Constructor = Vue.extend(WizardStep);
      const apiResponse = { body: ['my cool field'] };
      jest.spyOn(WizardFieldService.prototype, 'query').mockReturnValue({ then: (fn) => fn(apiResponse) });
      const vm = new Constructor({ propsData: { step: 'my step', wizardId: 'my wizard id' } }).$mount();

      expect(vm.fields).toEqual(['my cool field']);
    });
  });

});
