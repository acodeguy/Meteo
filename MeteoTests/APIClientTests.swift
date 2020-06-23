import XCTest
@testable import Meteo

class APIClientTests: XCTestCase {
    private var urlSession: URLSessionMock!
    private var apiClientService: APIClient!
    
    override func setUp() {
        urlSession = URLSessionMock()
        apiClientService = APIClient(session: urlSession)
    }
    
    override func tearDown() {
        urlSession = nil
        apiClientService = nil
    }
    
    func testCallsTheCorrectURL() {
        let validURL = URL(string: "\(Constants.API.baseURL)/location/721943")!
        
        apiClientService.fetch(dataType: WeatherResponse.self, from: validURL) { _ in
            XCTAssertEqual(self.urlSession.lastURLRequested, validURL)
        }
    }
    
    func testReturnsTheLocationTitle() {
        let dummyURL = URL(string: "dummy-url")!
        
        apiClientService.fetch(dataType: WeatherResponse.self, from: dummyURL) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.title, "Rome")
            default:
                XCTFail("The stubbed data did not return Rome as its title")
            }
        }
    }
    
    func testReturnsTheCurrentTemperature() {
        let dummyURL = URL(string: "dummy-url")!
        
        apiClientService.fetch(dataType: WeatherResponse.self, from: dummyURL) { result in
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
