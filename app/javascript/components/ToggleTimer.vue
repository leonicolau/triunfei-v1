<template>
  <div>
    <div
      v-show="loading"
      class="loader">
      <div class="message">{{ message }}</div>
      <spinner size="massive"/>
    </div>
    <div v-show="!loading">
      <slot/>
    </div>
  </div>
</template>

<script>
  import Spinner from 'vue-simple-spinner'

  export default {
    name: 'ToggleTimer',
    components: { Spinner },
    props: {
      mseconds: {
        type: Number,
        required: true,
      },
      message: {
        type: String,
        required: true,
      },
    },
    data() {
      return {
        loading: true
      }
    },
    mounted() {
      setTimeout(() => { this.loading = false }, this.mseconds);
    }
}
</script>

<style scoped>
  div.message {
    text-align: center;
    font-size: 24px;
    margin-top: 50px;
    margin-bottom: 50px;
  }

  div.loader {
    padding-bottom: 300px;
  }
</style>
