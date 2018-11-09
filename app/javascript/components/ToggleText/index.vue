<template>
  <div>
    <button
      :class="[visible ? 'fa fa-arrow-up' : 'fa fa-arrow-down']"
      @click="toggle()"/>
    <div
      v-show="visible"
      id="btn-toggle">
      <slot/>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        visible: false
      }
    },
    methods: {
      toggle(){
        this.visible = !this.visible
      }
    }
  }
</script>

<style scoped>
#btn-toggle {
  width: auto;
  word-wrap: break-word;
  font-size: 1.1em;
  margin: 0 0 1.5em 0;
  margin-top: 0px;
  margin-left: 20%;
  margin-right: 6%;
  text-align: justify;
  line-height: 1.3;
  text-indent: 3em;
}
</style>
