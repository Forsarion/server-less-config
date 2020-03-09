/// Lambda Output type wrapper
public struct Output: Codable {
    public let environment: Environment
    public let auth: Url
    public let api: Url
}
