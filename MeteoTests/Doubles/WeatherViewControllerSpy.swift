import Foundation
@testable import Meteo

class WeatherViewControllerSpy: WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol?
    var numberOfTimesSetWeatherWasCalled = 0
    
    func setWeather(weatherResponse: WeatherResponse) {
        numberOfTimesSetWeatherWasCalled += 1
    }
}
