<script setup>
import { reactive } from 'vue'
import HelloWorld from './components/HelloWorld.vue'
import axios from 'axios'

const state = reactive({
  initialResponse: '',
  finalResponse: '',
  pollNo: 0
})

async function startTx(event) {
  try {

    /*
    *  Phase 1 - Call the API to start the transaction
    */
    state.pollNo = 0
    state.initialResponse = ''
    state.finalResponse = ''

    // Start the transaction
    const startTransactionURL = 'http://127.0.0.1:33370/myProject/1.0/myPipeline'
    const reply = await axios.get(startTransactionURL)
    const { response, txId, complete } = parseDatpReply(reply)
    state.initialResponse = JSON.stringify(response, '', 2)
    if (complete) {
      // The transaction is already complete, we won't need to poll
      state.finalResponse = 'Polling not required'
      return
    }

    /*
    *  Phase 2 - We'll need to poll until the transaction is complete.
    */
    // Tip: This URL is displayed when the server starts.
    const getStatusURL = `http://127.0.0.1:33370/datp/1.0/tx/status/${txId}`
    for ( ; ; ) {

      // Wait a while (normally longer than 5 seconds).
      await pause(5)

      // Poll to see if the status has changed
      state.pollNo++
      const reply = await axios.get(getStatusURL)
      const { response, complete } = parseDatpReply(reply)
      if (complete) {
        // The transaction is now complete, stop polling
        state.finalResponse = JSON.stringify(response, '', 2)
        return
      }
    }

  } catch (e) {
    state.response = 'Error starting transaction'
    console.log('Error: ', e)
  }
}


/*
 * Parse a stadard DATP reply (something like this...)
 *
 *  {
 *    metadata: {
 *      txId: 'tx-ecf427d88317e26795e5554eb01cd9f5c4c8024b',
 *      status: 'success',
 *      ...
 *    },
 *    ...
 *  }
 */
 function parseDatpReply(axiosReply) {
  if (axiosReply.data && axiosReply.data.metadata && axiosReply.data.metadata.status) {
    const response = axiosReply.data
    const metadata = response.metadata
    const txId = metadata.txId
    const status = metadata.status
    const complete = (status==='success' || status==='failed' || status==='aborted')
    return { response, txId, status, complete }
  }
  throw new Exception('Reply does not include metadata')
}

// Pause for a few seconds before proceeding.
async function pause(seconds) {
  return new Promise((resolve, reject) => {
    setTimeout(() => resolve(), seconds * 1000)
  })
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
    <br>
    Initial Response:
    <br>
    <textarea v-model="state.initialResponse" rows="10" cols="50"/>
    <br>
    Final Response: &nbsp;&nbsp;&nbsp;{{ state.pollNo > 0 ? `poll #${state.pollNo}` : '' }}
    <br>
    <textarea v-model="state.finalResponse" rows="10" cols="50"/>
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
