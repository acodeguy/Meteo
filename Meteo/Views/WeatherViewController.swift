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
            presenter.updateCurrentLocation()
        }
    }
    
    private func setupUI() {
        title = "Meteo"
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshWeather))
        
        view.addSubview(titleLabel)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(temperatureLabel)
        temperatureLabel.textColor = .label
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
    
    @objc private func refreshWeather() {
        presenter?.updateCurrentLocation()
    }
}
