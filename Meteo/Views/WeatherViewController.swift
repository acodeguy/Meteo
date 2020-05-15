import UIKit

class WeatherViewController: UIViewController, WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol?
    var dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    let titleLabel = UILabel()
    let temperatureLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        if let presenter = presenter {
            presenter.showWeather(for: "721943")
        }
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(temperatureLabel)
        temperatureLabel.textColor = .white
        temperatureLabel.backgroundColor = .black
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16)
        ])
    }
    
    func setWeather(weatherResponse: WeatherResponse) {
        dispatchQueue.async {
            self.titleLabel.text = "\(weatherResponse.title), \(weatherResponse.locationInfo.countryName)"
            
            guard let weather = weatherResponse.weather.first else { return }
            
            let temperature = round(weather.temperature)
            self.temperatureLabel.text = "\(temperature) ℃"
        }
    }
}
