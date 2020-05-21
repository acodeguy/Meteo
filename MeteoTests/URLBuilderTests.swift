import XCTest
@testable import Meteo

class URLBuilderTests: XCTestCase {
    func testReturnsTheCorrectURLWhenGivenAWoeID() {
        let builder = URLBuilder(baseURL: "https://www.metaweather.com/api")
        
        let url = builder.build(for: .woeid, with: "123456")
        
        let expectedURL = URL(string: "https://www.metaweather.com/api/location/123456")
        XCTAssertEqual(url, expectedURL)
    }
}
