class PreferencesPresenter: PreferencesPresenterProtocol {
    var view: PreferencesViewProtocol
    var preferencesService: PreferencesServiceProtocol
    
    required init(view: PreferencesViewProtocol, preferencesService: PreferencesServiceProtocol) {
        self.view = view
        self.preferencesService = preferencesService
    }
        
    func setDisplay() {
        let temperatureUnitPreference = preferencesService.integer(forKey: Constants.PreferencesKeys.temperatureUnit)
        view.setDisplay(temperateUnit: TemperatureUnit(rawValue: temperatureUnitPreference)!)
    }
    
    func savePreference(value: Int, forKey key: String) {
        preferencesService.set(value, forKey: key)
    }
}
