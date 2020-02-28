import AWSLambdaSwift
import core

let runtime = try Runtime()
runtime.registerLambda("config", handlerFunction: core.config)
try runtime.start()
