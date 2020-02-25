import XCTest
@testable import config

final class configTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(config().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
