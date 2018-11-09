/* eslint-disable no-undef */
import Vue from 'vue';
import WizardBankSelector from './index.vue';
import BankService from '../../../../services/BankService';

describe('WizardBankSelector.vue', () => {
  describe('mounted', () => {
    it('uses BankService to query fields', () => {
      const Constructor = Vue.extend(WizardBankSelector);
      const thenMock = jest.fn();
      jest.spyOn(BankService.prototype, 'query').mockReturnValue({ then: thenMock });
      new Constructor({ propsData: { field: {} } }).$mount();

      expect(BankService.prototype.query).toBeCalled();
    });

    it('assigns api data body to fields', () => {
      const Constructor = Vue.extend(WizardBankSelector);
      const apiResponse = { body: ['my cool bank'] };
      jest.spyOn(BankService.prototype, 'query').mockReturnValue({ then: (fn) => fn(apiResponse) });
      const vm = new Constructor({ propsData: { field: {} } }).$mount();

      expect(vm.banks).toEqual(['my cool bank']);
    });
  });

});
