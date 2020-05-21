import XCTest
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
        let session = URLSessionMock()
        let service = APIClientStub(session: session)
        let view = WeatherViewControllerSpy()
        let locationService = LocationService(manager: LocationManagerMock())
        let sut = WeatherPresenter(view: view, service: service, locationService: locationService)
        view.presenter = sut
        
        sut.showWeather()
        
        XCTAssertEqual(view.numberOfTimesSetWeatherWasCalled, 1, "setWeather was not called the required number of times")
    }
}
