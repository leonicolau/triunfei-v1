<template>
  <div class="container container--wizard-helper">
    <div class="row">
      <div class="col-sm-12">
        <div class="desktop">
          <ul class="nav nav-pills nav-justified">
            <li
              :class="{ active: isStep(1) }"
              role="presentation">
              <a class="step">Parte 1</a>
            </li>
            <li
              :class="{ active: isStep(2) }"
              role="presentation">
              <a class="step">Parte 2</a>
            </li>
            <li
              :class="{ active: isStep(3) }"
              role="presentation">
              <a class="step">Parte 3</a>
            </li>
          </ul>
        </div>
        <div class="mobile">
          <ul class="nav nav-pills nav-justified">
            <li
              :class="{ active: isStep(currentStep) }"
              role="presentation">
              <a class="step">Parte {{ currentStep }}</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="steps-container">
      <div class="steps-container-fields">
        <wizard-step
          v-show="isStep(1)"
          :wizard-id="wizardId"
          step="1"
          @nextStep="nextStep"/>
        <wizard-step
          v-show="isStep(2)"
          :wizard-id="wizardId"
          step="2"
          @nextStep="nextStep"/>
        <wizard-step
          v-show="isStep(3)"
          :wizard-id="wizardId"
          step="3"
          @nextStep="nextStep"/>
      </div>
    </div>
  </div>
</template>

<script>
  import WizardStep from '../components/wizard/WizardStep/';
  import jQuery from 'jquery';

  export default {
    components: { WizardStep },
    props: {
      wizardId: {
        type: String,
        required: true,
      }
    },
    data() {
      return {
        currentStep: 1
      }
    },
    methods: {
      isStep(step) {
        return this.currentStep == step;
      },
      nextStep() {
        if(this.currentStep == 3) {
          jQuery('.edit_wizard').submit();
        } else {
          this.currentStep++;
        }
      }
    }
  }
</script>

<style scoped>
  .container {
    margin-top: 50px;
    margin-bottom: 50px;
  }
  a.step {
    padding: 20px;
  }
  .steps-container {
    margin-top: 30px;
    padding-top: 10px;
    padding-bottom: 300px;
  }

</style>
