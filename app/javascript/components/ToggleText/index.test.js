/* eslint-disable no-undef */
import Vue from 'vue';
import ToggleText from './index.vue';
import { shallowMount } from '@vue/test-utils';

describe('ToggleText.vue', () => {
  describe('template', () => {
    it('renders inner html inside invisible div', () => {
      const component = shallowMount(ToggleText, {
        slots: {
          default: 'My cool content'
        }
      });

      expect(component.find('#btn-toggle').text()).toEqual('My cool content');
      expect(component.find('#btn-toggle').element.style.display).toBe('none');
    });

    it('calls toggle when user click at the button', () => {
      const component = shallowMount(ToggleText);
      component.vm.toggle = jest.fn();

      component.find('button').trigger('click');

      expect(component.vm.toggle).toHaveBeenCalledTimes(1);
    });
  });

  describe('#toggle', () => {
    it('invert value of visible', () => {
      const Constructor = Vue.extend(ToggleText);
      const vm = new Constructor().$mount();
      expect(vm.visible).toBeFalsy();

      vm.toggle();

      expect(vm.visible).toBeTruthy();
    });
  });
});
