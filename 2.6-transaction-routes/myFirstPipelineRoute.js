import DATP from '@tooltwist/datp'


export async function myPipelineRouteV1(req, res, next) {
  console.log(`\n----- myPipelineRouteV1()`)

  const tenantId = req.tenant.tenantId

  try {
    const data = { }
    const metadata = {
      reply: 'shortpoll'
    }
    await DATP.startTransactionRoute(req, res, next, tenantId, 'myPipeline', data, metadata)
    // startTransactionRoute has already sent a reply
    return

  } catch (error) {
    console.log(`error=`, error)
    res.send(400, `Error starting transaction`)
    return next()
  }
}
