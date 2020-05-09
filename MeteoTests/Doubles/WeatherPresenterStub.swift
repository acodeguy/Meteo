import Foundation
@testable import Meteo

class WeatherPresenterStub: WeatherPresenterProtocol {
    var view: WeatherViewProtocol
    var service: ServiceProtocol
    
    required init(view: WeatherViewProtocol, service: ServiceProtocol) {
        self.service = service
        self.view = view
    }
    
    func showWeather(for woeid: String) {
        let response = WeatherResponse(title: "Rome", weather: [Weather(temperature: 28.04)])
        self.view.setWeather(weatherResponse: response)
    }
}
