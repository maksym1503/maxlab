import XCTest
@testable import MaxLabApp

final class MaxLabTests: XCTestCase {
    func testCatalogUsesStableSchemes() { XCTAssertEqual(LabApp(id: "reset", name: "Reset", purpose: "", scheme: "reset://", symbol: "", accent: .teal, available: false).scheme, "reset://") }
}
