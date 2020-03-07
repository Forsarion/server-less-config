import AWSLambdaSwift

public func config(input: Input, context: Context) -> Output {
    switch input.environment.value {
    case "dev":
        return Output(environment: input.environment,
                      auth: Url(value: "https://dev.auth.com"),
                      api: Url(value: "https://dev.api.com"))
    case "prod":
        return Output(environment: input.environment,
                      auth: Url(value: "https://prod.auth.com"),
                      api: Url(value: "https://prod.api.com"))
    default:
        return Output(environment: input.environment,
                      auth: Url(value: "https://auth-url.com"),
                      api: Url(value: "https://api-url.com"))
    }
}
