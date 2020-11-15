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
    
    // MARK: Variables
    
    var presenter: PreferencesPresenterProtocol?
    
    // MARK: Variables - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        
        return stackView
    }()
    
    private lazy var temperatureSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.insertSegment(withTitle: "℃ celsius", at: 0, animated: true)
        control.insertSegment(withTitle: "℉ fahrenheit", at: 1, animated: true)
        control.selectedSegmentTintColor = .systemGreen
        control.addTarget(self, action: #selector(temperatureUnitChanged), for: .valueChanged)
        
        return control
    }()
    
    private lazy var temperatureUnitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Temperature Unit"
        
        return label
    }()
        
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Preferences"
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        
        presenter?.setDisplay()
    }
    
    // MARK: Instance methods
    
    private func setupUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(temperatureUnitLabel)
        stackView.addArrangedSubview(temperatureSegmentedControl)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    func setDisplay(temperateUnit: TemperatureUnit) {
        temperatureSegmentedControl.selectedSegmentIndex = temperateUnit.rawValue
    }
    
    @objc private func temperatureUnitChanged(_ sender: UISegmentedControl) {
        presenter?.savePreference(value: sender.selectedSegmentIndex, forKey: Constants.PreferencesKeys.temperatureUnit)
    }
}
