import XCTest
@testable import Meteo

class WeatherAPIServiceTests: XCTestCase {
    func testCallsTheCorrectURL() {
        let session = URLSessionMock()
        let service = WeatherAPIServiceStub(session: session)
        let validURL = URL(string: "\(Constants.API.baseURL)/location/721943")!
        
        service.fetch(url: validURL) { _ in
            XCTAssertEqual(session.lastURLRequested, validURL)
        }
    }
    
    func testReturnsTheLocationTitle() {
        let session = URLSessionMock()
        let service = WeatherAPIServiceStub(session: session)
        let dummyURL = URL(string: "dummy-url")!
        
        service.fetch(url: dummyURL) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.title, "Rome")
            default:
                XCTFail("The stubbed data did not return Rome as its title")
            }
        }
    }
    
    func testReturnsTheCurrentTemperature() {
        let session = URLSessionMock()
        let service = WeatherAPIServiceStub(session: session)
        let url = URL(string: "\(Constants.API.baseURL)/location/721943")!
        
        service.fetch(url: url) { result in
            switch result {
            case .success(let response):
                if let currentWeather = response.weather.first {
                    XCTAssertEqual(currentWeather.temperature, 21.84, "Did not get the expected temperature.")
                } else {
                    XCTFail("Unable to get thhe temperature.")
                }
            default:
                XCTFail("The stubbed data did not return the current temperature of ")
            }
        }
    }
}
