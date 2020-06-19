// swiftlint:disable line_length
import XCTest
@testable import Meteo

class WeatherViewControllerTests: XCTestCase {
    private var service: APIClientStub!
    private var sut: WeatherViewController!
    private var presenter: WeatherPresenterStub!
    
    override func setUp() {
        service = APIClientStub(session: URLSessionMock())
        sut = WeatherViewController()
        sut.dispatchQueue = DispatchQueueMock()
        let locationServiceDummy = LocationServiceDummy(manager: LocationManagerDummy())
        presenter = WeatherPresenterStub(view: sut, service: service, locationService: locationServiceDummy, preferencesService: PreferencesServiceDummy())
        sut.presenter = presenter
        presenter.showWeather(for: 0)
    }
    
    override func tearDown() {
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
