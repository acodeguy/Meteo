// swiftlint:disable line_length
import Foundation

protocol WeatherPresenterProtocol {
    var view: WeatherViewProtocol { get set }
    var service: APIClientProtocol { get set }
    var locationService: LocationServiceProtocol { get set }
    var preferencesService: PreferencesServiceProtocol { get set }
    init(view: WeatherViewProtocol, service: APIClientProtocol, locationService: LocationServiceProtocol, preferencesService: PreferencesServiceProtocol)
    func showWeather(for woeid: Int)
    func updateCurrentLocation()
}
