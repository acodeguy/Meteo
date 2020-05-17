import Foundation

protocol WeatherPresenterProtocol {
    var view: WeatherViewProtocol { get set }
    var service: ServiceProtocol { get set }
    init(view: WeatherViewProtocol, service: ServiceProtocol)
    func showWeather(for woeid: Int)
}
