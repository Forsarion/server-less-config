import AWSLambdaSwift
import core

let runtime = try Runtime()
runtime.registerLambda("lambda", handlerFunction: core.config)
try runtime.start()
