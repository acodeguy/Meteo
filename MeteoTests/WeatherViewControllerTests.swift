import XCTest
@testable import Meteo

class WeatherViewControllerTests: XCTestCase {
    private var service: WeatherAPIServiceStub!
    private var sut: WeatherViewController!
    private var presenter: WeatherPresenterStub!
    
    override func setUp() {
        service = WeatherAPIServiceStub(session: URLSessionMock())
        sut = WeatherViewController()
        sut.dispatchQueue = DispatchQueueMock()
        presenter = WeatherPresenterStub(view: sut, service: service)
        sut.presenter = presenter
        presenter.showWeather(for: String())
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
