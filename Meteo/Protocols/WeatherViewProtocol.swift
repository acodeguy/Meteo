import Foundation

protocol WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol? { get set }
    func setWeather(weatherResponse: WeatherResponse)
    func setInformationPanel(_ text: String)
}
