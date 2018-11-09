<template>
  <div>
    <div class="col-md-10">
      <label>{{ field.label }}</label>
      <input
        :name="`user_wizard[user_wizard_answers_attributes][${field.id}][wizard_field_id]`"
        :value="field.id"
        type="hidden" >
      <select
        :name="`user_wizard[user_wizard_answers_attributes][${field.id}][value]`"
        class="form-control"
        @keyup.13.prevent="nextField()"
        @change="validateField($event)">
        <option/>
        <option
          v-for="(option, index) in dropdownOptions"
          :key="index"
          :value="option.value">{{ option.text }}</option>
      </select>
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
  export default {
    props: {
      field: {
        type: Object,
        required: true,
      }
    },
    data() {
      return {
        dropdownOptions: [],
        canContinue: false
      }
    },
    mounted() {
      var items = this.field.dropdown_options.split(';');
      items.forEach((item) => {
        var option = item.split(',');
        this.dropdownOptions.push({ value: option[0], text: option[1] });
      });
    },
    methods: {
      nextField() {
        if(this.canContinue) {
          this.$emit('nextField')
        }
      },
      validateField($event) {
        this.canContinue = $event.target.value.length > 0;
      },
    }
  }
</script>

<style scoped>
</style>
