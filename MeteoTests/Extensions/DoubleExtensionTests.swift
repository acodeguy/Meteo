import XCTest
@testable import Meteo

class DoubleExtensionTests: XCTestCase {
    func testToFahrenheitReturns50WhenGiven10() {
        let celsius: Double = 10.0
        let expectedFahrenheit: Double = 50
        
        let fahrenheit = celsius.toFahrenheit()
        
        XCTAssertEqual(fahrenheit, expectedFahrenheit)
    }
}
