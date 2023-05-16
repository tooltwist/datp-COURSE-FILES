/*
 *  This is a small mock client server, used to test and demonstrate webhooks.
 */
import express from 'express';
import cors from 'cors'

const app = express();
app.use(cors())
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Remember the transaction results we've been told about by
// the webhook. In a real life example these would be treated
// as having actual meaning (e.g. "the payment was completed").
const summaryByTxId = [ ] // txId => { .... }
const summaryByExternalId = [ ] // externalId => { ... }


// Route for our UI to ask for the transaction status, by transaction ID
app.get('/status/:txId', (req, res) => {
  const txId = req.params.txId
  console.log(`\n/status/${txId}`)
  const status = summaryByTxId[txId] ? summaryByTxId[txId] : { metadata: { status: 'not available' } }
  return res.send(status);
})


// Route for our UI to ask for the transaction status, by external
app.get('/statusByCustomerRef/:customerRef', (req, res) => {
  const customerRef = req.params.customerRef
  console.log(`\n/statusByCustomerRef/${customerRef}`)
  const status = summaryByExternalId[customerRef] ? summaryByExternalId[customerRef] : { metadata: { status: 'not available' } }
  return res.send(status);
})


// Web hook route, would normally be whitelisted access only
app.post('/notify', (req, res) => {
  console.log(`\n/notify`)

  const summary = req.body
  console.log(`summary=`, summary)

  summaryByTxId[summary.metadata.txId] = summary
  if (summary.metadata.externalId) {
    summaryByExternalId[summary.metadata.externalId] = summary
  }
  console.log(`Web hook: Received status of transaction ${summary.metadata.txId}`)
  return res.send({ status: 'ok' });
})


// Start the server
const PORT = 33340
app.listen(PORT, '0.0.0.0', () =>
  console.log(`ACME Corporation (mock) server listening on port ${PORT}`),
)