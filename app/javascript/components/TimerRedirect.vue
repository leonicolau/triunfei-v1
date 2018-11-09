<template>
  <div>
    <div class="loader">
      <spinner size="massive"/>
    </div>
    <div>
      <slot/>
    </div>
  </div>
</template>

<script>
  import Spinner from 'vue-simple-spinner'

  export default {
    name: 'TimerRedirect',
    components: { Spinner },
    props: {
      mseconds: {
        type: Number,
        required: true,
      },
      url: {
        type: String,
        required: true,
      },
    },
    mounted() {
      setTimeout(() => { window.location = this.url }, this.mseconds);
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
    margin-top: 7%;
  }
</style>
