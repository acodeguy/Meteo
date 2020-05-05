import XCTest
@testable import Meteo

class WeatherAPIServiceTests: XCTestCase {
    func testReturnsTheLocationTitle() {
        let service = WeatherAPIServiceStub()
        let dummyURL = URL(string: "dummy-url")!
        
        service.fetch(url: dummyURL, using: .shared) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.title, "Rome")
            default:
                XCTFail("The stubbed data did not return Rome as its title")
            }
        }
    }
}
