import XCTest
@testable import Meteo

class PreferencesStorageServiceTests: XCTestCase {
    func testItReturnsTheUserPreferencesAsADictionary() {
        let storageService = UserDefaultsMock()
        let preferences = ["temperatureUnit": "celsius"]
        
        storageService.savePreferences(preferences)
        
        let fetchedPreferences = storageService.fetchPreferences()
        if let temperaturePreference = fetchedPreferences["temperatureUnit"] as? String {
            XCTAssertEqual(temperaturePreference, "celsius")
        } else {
            XCTFail("getting the temperature unit preference failed")
        }
    }
}
