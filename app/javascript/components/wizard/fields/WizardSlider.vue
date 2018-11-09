<template>
  <div>
    <div class="col-md-10">
      <label>{{ field.label }}</label>
      <input
        :name="`user_wizard[user_wizard_answers_attributes][${field.id}][wizard_field_id]`"
        :value="field.id"
        type="hidden" >
      <input
        :name="`user_wizard[user_wizard_answers_attributes][${field.id}][value]`"
        v-model="sliderValue"
        type="hidden">
      <vue-slider
        ref="slider"
        :max="field.max_value"
        :min="field.min_value"
        :interval="field.interval"
        v-model="sliderValue"/>
    </div>
    <div
      class="col-md-2"
      style="padding-top: 20px">
      <button
        class="btn btn-steps btn-block"
        @click.prevent="nextField()">Continuar</button>
    </div>
  </div>
</template>

<script>
  import VueSlider from 'vue-slider-component'

  export default {
    components: { VueSlider },
    props: {
      field: {
        type: Object,
        required: true,
      }
    },
    data() {
      return {
        sliderValue: 0
      }
    },
    mounted() {
      this.sliderValue = this.field.default_value || ( this.field.max_value / 2 )
    },
    methods: {
      nextField() {
        this.$emit('nextField')
      }
    }
  }
</script>

<style scoped>
</style>
