import XCTest
@testable import AL_Extensions

final class AL_ExtensionsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AL_Extensions().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
