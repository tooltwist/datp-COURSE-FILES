// See https://github.com/mcollina/autocannon
// See https://www.nearform.com/blog/load-testing-with-autocannon/
const autocannon = require('autocannon')

function loadtest() {
  // Check what URL we will call.
  let url = process.env.LOADTEST_URL
  if (!url) {
    console.log('Missing environment variable LOADTEST_URL')
    process.exit(1)
  }
  console.log(`Base URL: ${url}`)

  let errorCounter = 0
  const definition = {
    url,
    connections: 100,
    requests: [
      {
        method: 'GET',
        onResponse: (status, body, context) => {
          if (status === 200) {
            if (body !== '"hello Fred"') {
              errorCounter++
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

  if (process.env.LOADTEST_CONNECTIONS) {
    const num = parseInt(process.env.LOADTEST_CONNECTIONS)
    if (num !== NaN) {
      definition.connections = num
    }
  }
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

  console.log(`  connections: ${definition.connections}`)
  console.log(`     duration: ${definition.duration}`)
  console.log(`       amount: ${definition.amount}`)
  console.log(`          url: ${definition.url}`)

  const instance = autocannon(definition, (err, result) => {
    if (err) {
      console.log(`ERROR=`, ERROR)
      console.log(`err=`, err)
    } else {
      autocannon.printResult(result)
      console.log(``)
      console.log(`${errorCounter} INCORRECT STATUSES`)
    }
  })

  instance.on('reqError', (aaa) => {
    console.log(`reqError=`, aaa)
  })

  autocannon.track(instance, {renderProgressBar: true})
}// loadtest


// Wait a bit before starting, to give the server a change to start
setTimeout(loadtest, 50)
