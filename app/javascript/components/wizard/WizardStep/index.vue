<template>
  <div>
    <div
      v-for="(field, index) in fields"
      v-show="selectedIndex == index"
      :key="index"
      class="form-group">
      <component
        :field="field"
        :is="field.wizard_field_type"
        @nextField="nextField()"/>
    </div>
  </div>
</template>

<script>
  import WizardFieldService from '../../../services/WizardFieldService';
  import WizardText from '../fields/WizardText.vue';
  import WizardDropdown from '../fields/WizardDropdown.vue';
  import WizardSlider from '../fields/WizardSlider.vue';
  import WizardMasked from '../fields/WizardMasked.vue';
  import WizardBankSelector from '../fields/WizardBankSelector/index.vue';
  import jQuery from 'jquery';

  export default {
    components: { WizardText, WizardDropdown, WizardSlider, WizardBankSelector, WizardMasked },
    props: {
      step: {
        type: String,
        required: true,
      },
      wizardId: {
        type: String,
        required: true,
      },
    },
    data() {
      return {
        fields: [],
        selectedIndex: 0
      }
    },
    mounted() {
      new WizardFieldService().query({step: this.step, visible: true, wizard_id: this.wizardId}).then((data) => {
        this.fields = data.body;
      })
    },
    methods: {
      nextField() {
        if(this.selectedIndex == (this.fields.length - 1)) {
          this.$emit('nextStep');
        } else {
          this.selectedIndex++;
        }
        // TODO: this is a hack to focus field, remove it in future and use vue way
        setTimeout(function() {
          jQuery('.container--wizard-helper').find('input:visible').focus();
        }, 200)
      }
    }
  }
</script>

<style scoped>
</style>
