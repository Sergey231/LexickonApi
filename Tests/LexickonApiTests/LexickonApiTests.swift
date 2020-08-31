import XCTest
@testable import LexickonApi

final class LexickonApiTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LexickonApi().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
