import XCTest
@testable import Meteo

class WeatherPresenterTests: XCTestCase {
    func testShouldCallSetWeatherOnItsView() {
        let service = WeatherAPIServiceStub()
        let view = WeatherViewControllerSpy()
        let sut = WeatherPresenter(view: view, service: service)
        view.presenter = sut
        
        sut.showWeather()
        
        XCTAssertEqual(
            view.numberOfTimesSetWeatherWasCalled,
            1,
            "setWeather was not called the required number of times"
        )
    }
}
