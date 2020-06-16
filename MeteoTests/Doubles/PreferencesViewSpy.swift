@testable import Meteo

class PreferencesViewSpy: PreferencesViewProtocol {
    var numberOfTimesDisplayPreferencesCalled = 0
    
    func displayPreferences() {
        numberOfTimesDisplayPreferencesCalled += 1
    }
}
