import UIKit
@testable import Meteo

class WeatherViewControllerSpy: WeatherViewProtocol {
    var weatherIconImageView: UIImageView = UIImageView()
    var presenter: WeatherPresenterProtocol?
    var numberOfTimesSetWeatherWasCalled = 0
    var numberOfTimesSetInformationPanelWasCalled = 0
    var numberOfTimesSetWeatherImageWasCalled = 0
        
    func setWeather(weatherResponse: WeatherResponse) {
        numberOfTimesSetWeatherWasCalled += 1
    }
    
    func setInformationPanel(_ text: String) {
        numberOfTimesSetWeatherWasCalled += 1
    }
    
    func setWeatherImage(with image: UIImage) {
        numberOfTimesSetWeatherImageWasCalled += 1
    }
}
