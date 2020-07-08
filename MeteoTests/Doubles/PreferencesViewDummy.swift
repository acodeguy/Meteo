@testable import  Meteo

class PreferencesViewDummy: PreferencesViewProtocol {
    var presenter: PreferencesPresenterProtocol?
    
    func setDisplay(temperateUnit: TemperatureUnit) {}
}
