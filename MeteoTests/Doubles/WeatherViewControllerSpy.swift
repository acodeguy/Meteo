import Foundation
@testable import Meteo

class WeatherViewControllerSpy: WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol?
    var numberOfTimesSetWeatherWasCalled = 0
    var numberOfTimesSetInformationPanelWasCalled = 0
    
    func setWeather(weatherResponse: WeatherResponse) {
        numberOfTimesSetWeatherWasCalled += 1
    }
    
    func setInformationPanel(_ text: String) {
        numberOfTimesSetWeatherWasCalled += 1
    }
    
}
