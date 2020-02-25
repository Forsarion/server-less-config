import AWSLambdaSwift

struct Environment: Codable {
    let value: String
}

struct Url: Codable {
    let value: String
}

struct Input: Codable {
    let environment: Environment
}

struct Output: Codable {
    let environment: Environment
    let auth: Url
    let api: Url
}

func config(input: Input, context: Context) -> Output {
    Output(environment: input.environment,
           auth: Url(value: "https://auth-url.com"),
           api: Url(value: "https://api-url.com"))
}

let runtime = try Runtime()
runtime.registerLambda("Config", handlerFunction: config)
try runtime.start()
