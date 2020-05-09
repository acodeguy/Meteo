import XCTest
@testable import Meteo

class WeatherViewControllerTests: XCTestCase {
    func testSetsTheLocationLabel() {
        let service = WeatherAPIServiceStub(session: URLSessionMock())
        let sut = WeatherViewController()
        sut.dispatchQueue = DispatchQueueMock()
        let presenter = WeatherPresenterStub(view: sut, service: service)
        sut.presenter = presenter
        
        presenter.showWeather(for: "dummy-url")
        
        XCTAssertEqual(sut.titleLabel.text, "Rome")
    }
}
