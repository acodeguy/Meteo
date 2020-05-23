import XCTest
@testable import Meteo

class URLBuilderTests: XCTestCase {
    var builder: URLBuilderProtocol!
    
    override func setUp() {
        builder = URLBuilder(baseURL: "https://www.metaweather.com/api")
    }
    
    override func tearDown() {
        builder = nil
    }
    
    func testReturnsTheCorrectURLWhenGivenAWoeID() {
        let url = builder.build(for: .woeid, with: "123456")
        
        let expectedURL = URL(string: "https://www.metaweather.com/api/location/123456")
        XCTAssertEqual(url, expectedURL)
    }
    
    func testReturnsTheCorrectURLWhenGivenALattLong() {
        let url = builder.build(for: .locations, with: "123,-456")
        
        let expectedURL = URL(string: "https://www.metaweather.com/api/location/search/?lattlong=123,-456")
        XCTAssertEqual(url, expectedURL)
    }
    
    func testReturnsTheCorrectURLWhenGivenAWeatherStateAbbreviation() {
        let url = builder.build(for: .icon, with: "lc")
        
        let expectedURL = URL(string: "\(builder.baseURLString)/static/img/weather/lc.svg")
        XCTAssertEqual(url, expectedURL)
    }
}
