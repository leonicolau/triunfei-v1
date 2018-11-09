<template>
  <div>
    <div class="col-md-12">
      <label>{{ field.label }}</label>
    </div>
    <div class="col-md-12">
      <input
        :name="`user_wizard[user_wizard_answers_attributes][${field.id}][wizard_field_id]`"
        :value="field.id"
        type="hidden" >
      <div
        v-for="bank in banks"
        :key="bank.id"
        class="form-card">
        <input
          :name="`user_wizard[user_wizard_answers_attributes][${field.id}][value]`"
          :value="bank.name"
          :style="`background: url('${bank.photo_url}') 50% 50% no-repeat;background-size: 6em;`"
          class="form-card-sel card-banco icon"
          type="checkbox"
          @change="nextField()">
      </div>
    </div>
  </div>
</template>

<script>
  import BankService from '../../../../services/BankService';

  export default {
    props: {
      field: {
        type: Object,
        required: true,
      }
    },
    data() {
      return {
        banks: []
      }
    },
    mounted() {
      new BankService().query().then((data) => {
        this.banks = data.body;
      })
    },
    methods: {
      nextField() {
        this.$emit('nextField')
      }
    }
  }
</script>

<style scoped>
@media screen and (max-width: 470px) {
  .card-banco{
background-size: 6em;
margin-top: -1em;
  }}

@media screen and (max-width: 490px) {
.form-card {
    position: relative;
    width: 41% !important;
    border-style: solid;
    border-width: 2px;
    border-color: grey;
    display: inline-block;
    margin: 0 20px 0 0;
    text-align: center;
    height: 7.5em;
} }

  .form-card {
    position: relative;
    width: 15%;
    border-style:solid;
    border-width:2px;
    border-color:grey;
    display: inline-block;
    margin: 0 20px 0 0;
    text-align: center; }

  .form-card:hover, .form-card:checked {
    transition: none;
    border-radius:1px;
    border-style:solid;
    border-width:1px;
    border-color:#f9b61f;
  }

  .form-card-label {
    position: relative;
    bottom: 40px;
  }



  .icon-todos {
    background: asset-url("wizards/bancos/todos.png") 50% 50% no-repeat;
    background-size: 100%;
  }

  .icon {
    filter: grayscale(100%); }
    .icon:hover, .icon:checked {
      filter: none; }
    .icon-elo {
      background: asset-url("wizards/bandeiras/elo.png") 50% 50% no-repeat;
      background-size: 70%; }
    .icon-american {
      background: asset-url("wizards/bandeiras/american.png") 50% 50% no-repeat;
      background-size: 50%; }
    .icon-mastercard {
      background: asset-url("wizards/bandeiras/mastercard.png") 50% 50% no-repeat;
      background-size: 50%; }
    .icon-visa {
      background: asset-url("wizards/bandeiras/visa.png") 50% 50% no-repeat;
      background-size: 70%; }
    .icon-todas {
      background: asset-url("wizards/bandeiras/todas.png") 50% 50% no-repeat;
      background-size: 100%; }

  .form-card-sel {
    position: relative;
    width: 80%;
    height: 150px;
    padding: 5px;
    z-index: 1;
    border:none;
    -webkit-appearance: none;
    -moz-appearance: none;
  }

    .form-card-sel:focus {
      outline: none; }
  .form-card-sel card-banco icon{
    border:none;
  }
  svg {
  position: absolute;
  right: 0;
  left: 0;
  height: 60%;
  margin: auto; }
</style>
