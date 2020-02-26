import AWSLambdaSwift

func config(input: Input, context: Context) -> Output {
    Output(environment: input.environment,
           auth: Url(value: "https://auth-url.com"),
           api: Url(value: "https://api-url.com"))
}
