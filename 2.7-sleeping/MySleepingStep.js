import { Step, StepTypes, StepInstance } from '@tooltwist/datp'

class MySleepingStep extends Step {

  /**
   * Perform any setup required, using the definition entered
   * (as JSON) when the step was added to the pipeline in MONDAT.
   * The constructor should save relevant parts of the
   * definition as private variables in the step object, for
   * use later by invoke() below.
   * 
   * 
   * @param {Object} definition
   */
  constructor(definition) {
    super(definition)
  }

  /**
   * This is the function that performs the logic of the step.
   * The instance object provides access to the input to the step,
   * which will be the output of the previous step, of the input
   * to the pipeline.
   * 
   * See https://datp.io for the API documentation.
   * 
   * @param {StepInstance} instance 
   * @returns This function MUST return the value from one of
   *  instance.succeeded,
   *  instance.failed,
   *  instance.aborted,
   *  instance.exceptionInStep, or
   *  instance.retryLater.
   */
  async invoke(instance) {
    console.log('mySleepingStep.invoke()')

    // If this is the first time this step has been called, do the sleep.
    const counter = await instance.getRetryCounter()
    console.log(`counter=`, counter)
    if (counter === 0) {

      console.log(`- first time - going to sleep...`)
      const delaySeconds = 30
      return await instance.retryLater(null, delaySeconds)
    }

    // Return with the step completed.
    console.log(`- repeat call, complete step.`)
    const output = { message: 'Hello world'}
    return await instance.succeeded('greetings!', output)
  }
}

/**
 * This function is called to register the step with DATP.
 */
async function register() {
  await StepTypes.register(myDef, 'myProject/mySleepingStep', 'Test sleeping')
}

/**
 * This function provides the default definition for the
 * step when it is added to a pipeline using MONDAT.
 */
async function defaultDefinition() {
  return { }
}

/**
 * This function is called by DATP to instantiate this
 * step type while a pipeline is being run.
 * 
 * @param {*} definition 
 * @returns 
 */
async function factory(definition) {
  return new MySleepingStep(definition)
}

const myDef = {
  register,
  factory,
  defaultDefinition,
}
export default myDef
