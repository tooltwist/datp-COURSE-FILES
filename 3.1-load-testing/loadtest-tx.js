// See https://github.com/mcollina/autocannon
// See https://www.nearform.com/blog/load-testing-with-autocannon/

const CLIENT_TIMEOUT = 20 // Must be longer than the longpoll timeout

function loadtest() {
  console.log(`Starting load test...`)

  const autocannon = require('autocannon')
  //let url = 'http://127.0.0.1:43370'
  let url = process.env.LOADTEST_URL
  if (!url) {
    console.log('Missing environment variable LOADTEST_URL')
    process.exit(1)
  }
  console.log(`Base URL: ${url}`)

  // console.log(`process.env=`, process.env)
  const definition = {
    url,
    connections: 100,
    // amount: 200,
    // duration: 10,
    timeout: CLIENT_TIMEOUT,
    requests: [

      // The request being tested
      {
        method: 'PUT',
        // path: `/datp/1.0/tx/start/test-master`,
        headers: {
          'Content-Type': 'application/json',
          'X-Client-Id': 'acme',
        },
        onResponse: (status, body, context) => {
          // console.log(`status=`, status)
          // console.log(`body=`, body)
          if (status === 200) {
            const reply = JSON.parse(body)
            if (reply.metadata && reply.metadata.status === 'success') {
              // All okay
              successCounter++
            } else if (reply.metadata && reply.metadata.status === 'running') {
              // All okay
              runningCounter++
            } else {
              console.log(`\nreply=`, reply)
              badStatusCounter++
            }
          } else {
            console.log(`ERROR GETTING STATUS:`)
            console.log(`status=`, status)
            console.log(`body=`, body)
            console.log(`context=`, context)
          }
        }
      }
    ]
  }

  /*
   *  See if a GET is required instead of a put
   */
  if (process.env.LOADTEST_OPERATION === 'GET') {
    definition.requests[0].method = 'GET'
  }

  /*
   *  Request URL
   */
  if (process.env.LOADTEST_URL) {
    definition.url = process.env.LOADTEST_URL
  }

  /*
   *  Number of connections.
   */
  if (process.env.LOADTEST_CONNECTIONS) {
    const num = parseInt(process.env.LOADTEST_CONNECTIONS)
    if (num !== NaN) {
      definition.connections = num
    }
  }

  /*
   *  Are we restricting the rate of transactions?
   */
  if (process.env.LOADTEST_RATE) {
    const num = parseInt(process.env.LOADTEST_RATE)
    if (num !== NaN) {
      definition.overallRate = num
    }
  }

  /*
   *  Will we use short or long polling?
   */
  const body = { metadata: { reply: 'shortpoll' }, data: {} }
  if (process.env.LOADTEST_LONGPOLL == 'Y') {
    body.metadata.reply = 'longpoll'
  }
  definition.requests[0].body = JSON.stringify(body)

  /*
   *  Are we testing for a duration, or a fixed number of tests?
   */
  if (process.env.LOADTEST_AMOUNT) {
    const num = parseInt(process.env.LOADTEST_AMOUNT)
    if (num !== NaN) {
      definition.amount = num
    }
  } else if (process.env.LOADTEST_DURATION) {
    const num = parseInt(process.env.LOADTEST_DURATION)
    if (num !== NaN) {
      definition.duration = num
    }
  } else {
    definition.duration = 10
  }

  // console.log(`definition=`, definition)


  console.log(`  connections: ${definition.connections}`)
  console.log(`         rate: ${definition.overallRate}`)
  console.log(`     duration: ${definition.duration}`)
  console.log(`       amount: ${definition.amount}`)
  console.log(`          url: ${definition.url}`)
  console.log(`        reply: ${body.metadata.reply}`)

  let successCounter = 0
  let runningCounter = 0
  let badStatusCounter = 0
  let numRequestErrors = 0
  const instance = autocannon(definition, (err, result) => {
    if (err) {
      console.log(`ERROR=`, ERROR)
      console.log(`err=`, err)
    } else {
      // console.log(`\n\nCOMPLETE`)
      // console.log(`result=`, result)
      autocannon.printResult(result)

      // if (badStatusCounter !== 0) {
        console.log(``)
        console.log(`      INCORRECT statuses: ${badStatusCounter}`)
        console.log(`   With 'success' status: ${successCounter}`)
        console.log(`   With 'running' status: ${runningCounter} `)
      // }
      if (numRequestErrors) {
        console.log(`${numRequestErrors} REQUEST ERRORS`)
      }
      console.log(``)
    }
  })

  // instance.on('response', (client, statusCode, resBytes, responseTime) => {
  //   console.log(`RESPONSE=`, statusCode)
  // })

  instance.on('reqError', (aaa) => {
    console.log(`reqError=`, aaa)
    numRequestErrors++
  })

  autocannon.track(instance, {renderProgressBar: true})
}// loadtest


// Wait a bit before starting, to give the server a change to start
setTimeout(loadtest, 50)
