import UIKit

// MARK: - TemperatureUnit

enum TemperatureUnit: Int {
    case celsius = 0
    case fahrenheit = 1
}

// MARK: - PreferencesViewProtocol

protocol PreferencesViewProtocol {
    var presenter: PreferencesPresenterProtocol? { get set }
    func setDisplay(temperateUnit: TemperatureUnit)
}

// MARK: - PreferencesViewController

class PreferencesViewController: UIViewController, PreferencesViewProtocol {
    var presenter: PreferencesPresenterProtocol?
    private var stackView = UIStackView()
    private var temperatureSegmentedController = UISegmentedControl()
    private var temperatureUnitLabel = UILabel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Preferences"
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        
        presenter?.setDisplay()
    }
    
    private func setupUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        view.addSubview(stackView)
        
        temperatureUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureUnitLabel.text = "Temperature Unit"
        stackView.addArrangedSubview(temperatureUnitLabel)
        
        temperatureSegmentedController.translatesAutoresizingMaskIntoConstraints = false
        temperatureSegmentedController.insertSegment(withTitle: "℃ celsius", at: 0, animated: true)
        temperatureSegmentedController.insertSegment(withTitle: "℉ fahrenheit", at: 1, animated: true)
        temperatureSegmentedController.selectedSegmentTintColor = .systemGreen
        temperatureSegmentedController.addTarget(self, action: #selector(temperatureUnitChanged), for: .valueChanged)
        stackView.addArrangedSubview(temperatureSegmentedController)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    func setDisplay(temperateUnit: TemperatureUnit) {
        temperatureSegmentedController.selectedSegmentIndex = temperateUnit.rawValue
    }
    
    @objc private func temperatureUnitChanged(_ sender: UISegmentedControl) {
        presenter?.savePreference(value: sender.selectedSegmentIndex, forKey: Constants.PreferencesKeys.temperatureUnit)
    }
}
