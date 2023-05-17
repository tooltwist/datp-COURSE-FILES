import DATP, { schedulerForThisNode } from '@tooltwist/datp'
import { addRoute } from '@tooltwist/datp/extras'
import MyFirstStep from './steps/MyFirstStep'

const MYPROJECT_PREFIX = 'myProject'

/*
 * Example route for Restify
 */
function respond(req, res, next) {
  res.send('hello ' + req.params.name);
  next();
}

/*
 *  This function does whatever is required to check the incoming connection
 *  is from a valid user. The details of the user (tenant) get added to the
 *  request object, for use by DATP and the application downstream.
 */
async function middlewareToVerifyTenant(req, res, next) {

  // We'll just hard code the tenant while developing.
  req.tenant = { tenantId: 'acme' }
  next()
}

/*
 *  This is the main entry point into the program. 
 */
(async function main() {

  // Fire up the master DATP server.
  const server = await DATP.restifyMasterServer()

  // Set the tenant, if required by the URL
  server.use(middlewareToVerifyTenant)

  // Register our routes
  addRoute(server, 'get', MYPROJECT_PREFIX, '/hello/:name', [ { versions: '1.0 - 1.0', handler: respond } ])

  // Register our steps
  await MyFirstStep.register()

  // Start the server
  await DATP.goLive(server)
  console.log(`Node ${schedulerForThisNode.getNodeId()} is ready for use.`)

})().catch(e => {
  console.error(e)
})
