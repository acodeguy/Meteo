protocol PreferencesViewProtocol {
    var presenter: PreferencesPresenterProtocol? { get set }
    func setDisplay(temperateUnit: TemperatureUnit)
}
