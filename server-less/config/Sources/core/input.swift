/// Lambda input type wrapper
public struct Input: Codable {
    let environment: Environment
    public init(environment: Environment) {
        self.environment = environment
    }
}
