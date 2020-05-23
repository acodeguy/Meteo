import UIKit

protocol WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol? { get set }
    var weatherIconImageView: UIImageView { get set }
    func setWeather(weatherResponse: WeatherResponse)
    func setInformationPanel(_ text: String)
    func setWeatherImage(with image: UIImage)
}
