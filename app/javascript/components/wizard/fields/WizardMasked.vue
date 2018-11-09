<template>
  <div>
    <div class="col-md-10">
      <label>{{ field.label }}</label>
      <input
        :name="`user_wizard[user_wizard_answers_attributes][${field.id}][wizard_field_id]`"
        :value="field.id"
        type="hidden" >
      <input
        v-mask="field.mask"
        :name="`user_wizard[user_wizard_answers_attributes][${field.id}][value]`"
        :placeholder="placeholder"
        type="text"
        class="form-control"
        @keyup.13.prevent="nextField()"
        @keyup="validateField($event)">
      <p
        v-show="!canContinue"
        class="help-block pull-right">Por favor informe um valor.</p>
    </div>
    <div
      class="col-md-2"
      style="padding-top: 20px">
      <a
        :disabled="!canContinue"
        class="btn btn-steps btn-block"
        @click.prevent="nextField()">Continuar</a>
    </div>
  </div>
</template>

<script>
  import { mask } from 'vue-the-mask'

  export default {
    directives: { mask },
    props: {
      field: {
        type: Object,
        required: true,
      }
    },
    data() {
      return {
        canContinue: false
      }
    },
    computed: {
      placeholder() {
        return this.field.mask.replace(/#/g, '9');
      }
    },
    methods: {
      nextField() {
        if(this.canContinue) {
          this.$emit('nextField')
        }
      },
      validateField($event) {
        this.canContinue = $event.target.value.length > 0;
      }
    }
  }
</script>

<style scoped>
</style>
