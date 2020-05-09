import UIKit

class WeatherViewController: UIViewController, WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol?
    var dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    let titleLabel = UILabel()
    
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
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setWeather(weatherResponse: WeatherResponse) {
        dispatchQueue.async {
            self.titleLabel.text = weatherResponse.title
        }
    }
}
