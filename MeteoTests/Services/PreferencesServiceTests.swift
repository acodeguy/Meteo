import XCTest
@testable import Meteo

class PreferencesServiceTests: XCTestCase {
    func testRetrievessAnIntegerValue() {
        let sut = PreferencesService()
        let expectedValue: Int = 987
        sut.set(expectedValue, forKey: "test")
        
        let retrievedValue: Int = sut.integer(forKey: "test")
        
        XCTAssertEqual(retrievedValue, expectedValue)
    }
}
