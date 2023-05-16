<script setup>
import { reactive } from 'vue'
import HelloWorld from './components/HelloWorld.vue'
import axios from 'axios'

const state = reactive({
  response: ''
})

async function startTx(event) {
  try {
    const url = 'http://localhost:33370/datp/1.0/healthcheck'
    state.response = 'transaction started'
    const reply = await axios.get(url)
    state.response = JSON.stringify(reply.data, '', 2)
  } catch (e) {
    state.response = 'Error starting transaction'
    console.log('Error: ', e)
  }
}

</script>

<template>
  <header>
    <img alt="Vue logo" class="logo" src="./assets/logo.svg" width="125" height="125" />

    <div class="wrapper">
      <HelloWorld msg="You did it!" />
    </div>

  </header>

  <div>
    <button @click="startTx">START Transaction</button>
    <br>
    <textarea v-model="state.response" rows="10" cols="50"/>
  </div>
</template>

<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
