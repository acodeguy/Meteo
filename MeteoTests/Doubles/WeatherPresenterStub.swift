import Foundation
@testable import Meteo

class WeatherPresenterStub: WeatherPresenterProtocol {
    var preferencesService: PreferencesServiceProtocol
    var locationService: LocationServiceProtocol
    var view: WeatherViewProtocol
    var service: APIClientProtocol
    
    required init(view: WeatherViewProtocol, service: APIClientProtocol, locationService: LocationServiceProtocol, preferencesService: PreferencesServiceProtocol) {
        self.service = service
        self.view = view
        self.locationService = locationService
        self.preferencesService = preferencesService
    }
    
    func showWeather(for woeid: Int) {
        let parentLocation = ParentLocation(countryName: "Italy")
        let weather = [Weather(temperature: 27.29, state: "Sunny", stateAbbreviation: "s")]
        let response = WeatherResponse(title: "Rome", weather: weather, locationInfo: parentLocation)
        self.view.titleLabel.text = "\(response.title), \(response.locationInfo.countryName)"
        self.view.temperatureLabel.text = "\(round(weather.first!.temperature)) ℃"
    }
    
    func updateCurrentLocation() {}
}
