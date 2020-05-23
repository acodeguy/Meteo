import Foundation
@testable import Meteo

class WeatherPresenterStub: WeatherPresenterProtocol {
    var locationService: LocationServiceProtocol
    var view: WeatherViewProtocol
    var service: APIClientProtocol
    
    required init(view: WeatherViewProtocol, service: APIClientProtocol, locationService: LocationServiceProtocol) {
        self.service = service
        self.view = view
        self.locationService = locationService
    }
    
    func showWeather(for woeid: Int) {
        let parentLocation = ParentLocation(countryName: "Italy")
        let weather = [Weather(temperature: 27.29, state: "Sunny", stateAbbreviation: "s")]
        let response = WeatherResponse(title: "Rome", weather: weather, locationInfo: parentLocation)
        self.view.setWeather(weatherResponse: response)
    }
    
    func updateCurrentLocation() {}
}
