const axios = require('axios')

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

async function runMyPipeline() {

  /*
   *  Phase 1 - Call the API to start the transaction
   */
  const startTransactionURL = 'http://127.0.0.1:33370/myProject/1.0/myPipeline'
  console.log(`Starting myPipeline...`)
  console.log(`- ${startTransactionURL}`)
  const reply = await axios.get(startTransactionURL)

  // If the transaction is already complete, we won't need to poll
  const { response, txId, status, complete } = parseDatpReply(reply)
  console.log(`Initial API call responded with`, response)
  if (complete) {
    console.log(`Transaction was complete in the initial response`)
    return response
  }
  console.log(`Transaction is still running.`)
  console.log(``)

  /*
   *  Phase 2 - We'll need to poll until the transaction is complete.
   */
  // Tip: This URL is displayed when the server starts.
  const getStatusURL = `http://127.0.0.1:33370/datp/1.0/tx/status/${txId}`
  for (let count = 1; ; count++) {

    // Wait a while (normally longer than 5 seconds).
    console.log(`sleeping...`)
    await pause(5)

    // Poll to see if the status has changed
    console.log(``)
    console.log(`poll #${count}...`)
    console.log(`- ${getStatusURL}`)
    const reply = await axios.get(getStatusURL)
    const { response, status, complete } = parseDatpReply(reply)

    // If the transaction is now complete, stop polling
    if (complete) {
      console.log(`Transaction finished with status ${status}.`)
      return response
    }
  }
}

async function main() {
  const txReply = await runMyPipeline()
  console.log(``)
  console.log(`----------------------------------------------`)
  console.log(`Our transaction completed with this result=>`, txReply)
}

main().catch(e => { console.log('ERROR ', e)})
