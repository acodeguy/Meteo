// swiftlint:disable identifier_name
import UIKit
@testable import Meteo

class WeatherViewControllerSpy: WeatherViewProtocol {
    var titleLabel = UILabel()
    var temperatureLabel = UILabel()
    var informationPanel = UILabel()
    var weatherIconImageView: UIImageView = UIImageView()
    var presenter: WeatherPresenterProtocol?
    var numberOfTimesSetWeatherWasCalled = 0
    var numberOfTimesSetInformationPanelWasCalled = 0
    var numberOfTimesSetWeatherImageWasCalled = 0
    
    func setInformationPanel(_ text: String) {
        numberOfTimesSetInformationPanelWasCalled += 1
    }
    
    func setWeatherImage(with image: UIImage) {
        numberOfTimesSetWeatherImageWasCalled += 1
    }
}
