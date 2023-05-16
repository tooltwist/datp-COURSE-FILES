// import axios from 'axios'
const axios = require('axios')

console.log(`Hello`)


async function main() {
  const url = 'http://localhost:33370/myProject/1.0/myPipeline'
  const reply = await axios.get(url)
  console.log(`reply=`, reply.data)

  // If not complete, start polling till completion
  ZZZZZ
}

main().catch(e => { console.log('ERROR ', e)})
