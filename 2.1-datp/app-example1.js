import DATP from '@tooltwist/datp'
import { addRoute } from '@tooltwist/datp/extras'

const MYPROJECT_PREFIX = 'myProject'

/*
 * Example route for Restify
 */
function respond(req, res, next) {
  res.send('hello ' + req.params.name);
  next();
}

/*
 *  This is the main entry point into the program. 
 */
(async function main() {

  // Fire up the master DATP server.
  const server = await DATP.restifyMasterServer()

  // Register our routes
  addRoute(server, 'get', MYPROJECT_PREFIX, '/hello/:name', [ { versions: '1.0 - 1.0', handler: respond } ])

  // Start the server
  await DATP.goLive(server)
  console.log(`Node is ready for use.`)

})().catch(e => {
  console.error(e)
})
