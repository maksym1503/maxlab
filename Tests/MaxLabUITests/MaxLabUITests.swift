import XCTest

final class MaxLabUITests: XCTestCase {
    @MainActor func testCatalogAndDetails() {
        let app = XCUIApplication()
        app.launch()
        let gamefy = app.buttons.matching(NSPredicate(format: "label BEGINSWITH %@", "Gamefy,")).firstMatch
        let reset = app.buttons.matching(NSPredicate(format: "label BEGINSWITH %@", "Reset,")).firstMatch
        XCTAssertTrue(gamefy.waitForExistence(timeout: 10))
        XCTAssertTrue(reset.exists)
        reset.tap()
        let close = app.buttons["Close"]
        XCTAssertTrue(close.waitForExistence(timeout: 5))
        close.tap()
        XCTAssertTrue(gamefy.waitForExistence(timeout: 5))
    }
}
