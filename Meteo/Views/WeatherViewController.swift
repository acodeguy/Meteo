import UIKit

class WeatherViewController: UIViewController, WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol?
    var dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    let titleLabel = UILabel()
    let temperatureLabel = UILabel()
    let informationPanel = UILabel()
    var weatherIconImageView: UIImageView = UIImageView()
    
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
        
        view.addSubview(weatherIconImageView)
        weatherIconImageView.contentMode = .scaleAspectFit
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(informationPanel)
        informationPanel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherIconImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            weatherIconImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 24),
            weatherIconImageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 24),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.centerXAnchor.constraint(equalTo: weatherIconImageView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 50),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            informationPanel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            informationPanel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            informationPanel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    func setWeather(weatherResponse: WeatherResponse) {
        dispatchQueue.async {
            self.titleLabel.text = "\(weatherResponse.title), \(weatherResponse.locationInfo.countryName)"
            
            guard let weather = weatherResponse.weather.first else { return }
            
            let temperature = round(weather.temperature)
            self.temperatureLabel.text = "\(temperature) ℃"
            
            self.setInformationPanel("Weather updated at \(Date().toShortTime())")
        }
    }
    
    func setWeatherImage(with image: UIImage) {
        DispatchQueue.main.async {
            self.weatherIconImageView.image = image
        }
    }
    
    func setInformationPanel(_ text: String) {
        self.informationPanel.text = text
    }
    
    @objc private func refreshWeather() {
        presenter?.updateCurrentLocation()
    }
}
