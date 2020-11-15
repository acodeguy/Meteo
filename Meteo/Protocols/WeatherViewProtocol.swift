import UIKit

protocol WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol? { get set }
    var weatherIconImageView: UIImageView { get set }
    var titleLabel: UILabel { get set }
    var temperatureLabel: UILabel { get set }
    var informationPanel: UILabel { get set }
    func setInformationPanel(_ text: String)
    func setWeatherImage(with image: UIImage, using queue: DispatchQueueProtocol)
}
