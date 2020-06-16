// swiftlint:disable line_length
import XCTest
import CoreLocation
@testable import Meteo

class WeatherPresenterTests: XCTestCase {
    private var urlSessionMock: URLSessionMock!
    private var clientStub: APIClientStub!
    private var weatherViewControllerSpy: WeatherViewControllerSpy!
    private var locationManagerDummy: LocationManagerDummy!
    private var locationServiceDummy: LocationServiceDummy!
    private var locationServiceSpy: LocationServiceSpy!
    
    override func setUp() {
        urlSessionMock = URLSessionMock()
        clientStub = APIClientStub(session: urlSessionMock)
        weatherViewControllerSpy = WeatherViewControllerSpy()
        locationManagerDummy = LocationManagerDummy()
        locationServiceSpy = LocationServiceSpy(manager: locationManagerDummy)
        locationServiceDummy = LocationServiceDummy(manager: locationManagerDummy)
    }
    
    override func tearDown() {
        urlSessionMock = nil
        clientStub = nil
        weatherViewControllerSpy = nil
        locationManagerDummy = nil
        locationServiceSpy = nil
    }
    
    func testShouldCallGetCurrentLocationOnItsLocationService() {
        let sut = WeatherPresenter(view: weatherViewControllerSpy, service: clientStub, locationService: locationServiceSpy)
        weatherViewControllerSpy.presenter = sut
        
        sut.updateCurrentLocation()
        
        XCTAssertEqual(locationServiceSpy.numberOfTimesGetCurrentLocationWasCalled, 1, "getCurrentLocation was not called the expected number of times")
    }
    
    func testShouldCallSetWeatherOnItsView() {
        let sut = WeatherPresenter(view: weatherViewControllerSpy, service: clientStub, locationService: locationServiceSpy)
        sut.urlBuilder = URLBuilder(baseURL: "dummy")
        weatherViewControllerSpy.presenter = sut
        
        sut.showWeather(for: 123456)
        
        XCTAssertEqual(weatherViewControllerSpy.numberOfTimesSetWeatherWasCalled, 1, "setWeather was not called the required number of times")
    }
    
    func testShouldCallSetWetherImage() {
        let sut = WeatherPresenter(view: weatherViewControllerSpy, service: clientStub, locationService: locationServiceDummy)
        sut.urlBuilder = URLBuilder(baseURL: "dummy")
        weatherViewControllerSpy.presenter = sut
        
        sut.fetchWeatherIcon(for: "lc")
        
        XCTAssertEqual(weatherViewControllerSpy.numberOfTimesSetWeatherImageWasCalled, 1, "setWeatherImage was not called the expected number of times")
    }
}
