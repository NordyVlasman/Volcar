import XCTest
@testable import Volcar

final class VolcarTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Volcar().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
