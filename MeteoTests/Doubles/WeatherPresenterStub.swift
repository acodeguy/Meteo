import Foundation
@testable import Meteo

class WeatherPresenterStub: WeatherPresenterProtocol {
    var view: WeatherViewProtocol
    var service: ServiceProtocol
    
    required init(view: WeatherViewProtocol, service: ServiceProtocol) {
        self.service = service
        self.view = view
    }
    
    func showWeather(for woeid: Int) {
        let parentLocation = ParentLocation(countryName: "Italy")
        let weather = [Weather(temperature: 27.29)]
        let response = WeatherResponse(title: "Rome", weather: weather, locationInfo: parentLocation)
        self.view.setWeather(weatherResponse: response)
    }
}
