import UIKit

class WeatherViewControler: UIViewController, WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol?
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let presenter = presenter {
            presenter.showWeather(for: "721943")
        }
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setWeather(weatherResponse: WeatherResponse) {
        DispatchQueue.main.async {
            self.titleLabel.text = weatherResponse.title
        }
    }
}
