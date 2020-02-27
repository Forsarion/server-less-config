import AWSLambdaSwift

let runtime = try Runtime()
runtime.registerLambda("config", handlerFunction: config)
try runtime.start()
