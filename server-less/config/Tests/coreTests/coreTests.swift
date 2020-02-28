import XCTest
import AWSLambdaSwift
@testable import core

final class coreTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(config(input: Input(environment: Environment(value: "value")),
            context: Context(environment: [:],
                             responseHeaderFields: ["Lambda-Runtime-Aws-Request-Id": "",
                                                    "Lambda-Runtime-Invoked-Function-Arn" : "",
                                                    "Lambda-Runtime-Deadline-Ms": "1000"])).environment.value, "value")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
