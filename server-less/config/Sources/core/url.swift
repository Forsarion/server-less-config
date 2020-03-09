/// Url phantom type
///
/// Foundation framework (and bunch of other Apple frameworks) 
/// isn't available on Linux
public struct Url: Codable {
    public let value: String
}
