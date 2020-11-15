import UIKit

// MARK: - WeatherViewProtocol

protocol WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol? { get set }
    var weatherIconImageView: UIImageView { get set }
    var titleLabel: UILabel { get set }
    var temperatureLabel: UILabel { get set }
    var informationPanel: UILabel { get set }
    func setInformationPanel(_ text: String)
    func setWeatherImage(with image: UIImage, using queue: DispatchQueueProtocol)
}

// MARK: - WeatherViewController

class WeatherViewController: UIViewController, WeatherViewProtocol {
    
    // MARK: Variables
    
    var presenter: WeatherPresenterProtocol?
    var dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    
    // MARK: Variables - UI
    
    internal lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Avenir", size: 50)
        
        return label
    }()
    
    internal lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 50)
        
        return label
    }()
    
    internal lazy var informationPanel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    internal lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        if let presenter = presenter {
            presenter.updateCurrentLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    // MARK: Instance methods
    
    func setWeatherImage(with image: UIImage, using queue: DispatchQueueProtocol) {
        queue.async {
            self.weatherIconImageView.image = image
        }
    }
    
    func setInformationPanel(_ text: String) {
        self.informationPanel.text = text
    }
    
    // MARK: Private methods
    
    private func setupUI() {
        title = "Meteo"
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(preferencesTapped)),
            UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshWeather))
            ]
        
        view.addSubview(weatherIconImageView)
        view.addSubview(titleLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(informationPanel)
        
        NSLayoutConstraint.activate([
            weatherIconImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            weatherIconImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 24),
            weatherIconImageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 24),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.centerYAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 150),
            
            temperatureLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            temperatureLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            informationPanel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            informationPanel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            informationPanel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    @objc private func refreshWeather() {
        presenter?.updateCurrentLocation()
    }
    
    @objc private func preferencesTapped() {
        let view = PreferencesViewController()
        let presenter = PreferencesPresenter(view: view, preferencesService: UserDefaults.standard)
        view.presenter = presenter
        
        navigationController?.pushViewController(view, animated: true)
    }
}
