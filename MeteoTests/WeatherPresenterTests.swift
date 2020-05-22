import XCTest
import CoreLocation
@testable import Meteo

class WeatherPresenterTests: XCTestCase {
    func testShouldCallGetCurrentLocationOnItsLocationService() {
        let service = APIClientStub(session: URLSessionMock())
        let view = WeatherViewControllerSpy()
        let locationService = LocationServiceSpy(manager: LocationManagerDummy())
        let sut = WeatherPresenter(view: view, service: service, locationService: locationService)
        view.presenter = sut
        
        sut.updateCurrentLocation()
        
        XCTAssertEqual(locationService.numberOfTimesGetCurrentLocationWasCalled, 1, "getCurrentLocation was not called the expected number of times")
    }
    
    func testShouldCallSetWeatherOnItsView() {
        let client = APIClientStub(session: URLSessionMock())
        let view = WeatherViewControllerSpy()
        let locationService = LocationServiceDummy(manager: LocationManagerDummy())
        let sut = WeatherPresenter(view: view, service: client, locationService: locationService)
        sut.urlBuilder = URLBuilder(baseURL: "dummy")
        view.presenter = sut
        
        sut.showWeather(for: 123456)
        
        XCTAssertEqual(view.numberOfTimesSetWeatherWasCalled, 1, "setWeather was not called the required number of times")
    }
}
