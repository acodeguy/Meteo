import XCTest
@testable import Meteo

class WeatherViewControllerTests: XCTestCase {
    private var jsonParser: JSONParserProtocol!
    private var service: APIClientStub!
    private var sut: WeatherViewController!
    private var presenter: WeatherPresenterStub!
    
    override func setUp() {
        jsonParser = JSONParserDummy(decoder: JSONDecoderDummy())
        service = APIClientStub(session: URLSessionMock(), jsonParser: jsonParser)
        sut = WeatherViewController()
        sut.dispatchQueue = DispatchQueueMock()
        let locationServiceDummy = LocationServiceDummy(manager: LocationManagerDummy())
        presenter = WeatherPresenterStub(view: sut, service: service, locationService: locationServiceDummy, preferencesService: PreferencesServiceDummy())
        sut.presenter = presenter
        presenter.showWeather(for: 0)
    }
    
    override func tearDown() {
        jsonParser = nil
        service = nil
        sut = nil
        presenter = nil
    }
    
    func testSetsTheLocationLabel() {
        XCTAssertEqual(sut.titleLabel.text, "Rome, Italy")
    }
    
    func testSetsTheCurrentTemperature() {
        XCTAssertEqual(sut.temperatureLabel.text, "27.0 ℃")
    }
}
