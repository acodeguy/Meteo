@testable import Meteo

class PreferencesViewSpy: PreferencesViewProtocol {
    var presenter: PreferencesPresenterProtocol?
    var numberOfTimesDisplayPreferencesCalled = 0
    
    func setDisplay(temperateUnit: TemperatureUnit) {
        numberOfTimesDisplayPreferencesCalled += 1
    }
}
