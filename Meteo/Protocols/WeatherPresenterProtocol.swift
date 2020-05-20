import Foundation

protocol WeatherPresenterProtocol {
    var view: WeatherViewProtocol { get set }
    var service: APIClientProtocol { get set }
    init(view: WeatherViewProtocol, service: APIClientProtocol)
    func showWeather(for woeid: Int)
}
