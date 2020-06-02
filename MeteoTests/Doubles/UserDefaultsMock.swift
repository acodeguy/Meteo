import XCTest
@testable import Meteo

class UserDefaultsMock: PreferencesStorageServiceProtocol {
    private var preferencesDictionary = [String: Any]()
    
    func fetchPreferences() -> [String: Any] {
        return preferencesDictionary
    }
    
    func savePreferences(_ preferences: [String: Any]) {
        for preference in preferences {
            preferencesDictionary[preference.key] = preference.value
        }
    }
}
