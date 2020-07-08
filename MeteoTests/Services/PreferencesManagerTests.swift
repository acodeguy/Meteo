import XCTest

class PreferencesManagerTests: XCTestCase {
    func testReturnsTheTemperatureUnitPreference() {
        let preferenceKeyName = "temperatureUnit"
        let preferenceValue = "celsius"
        let sut = UserDefaults.standard
        
        sut.set(preferenceValue, forKey: preferenceKeyName)
        
        XCTAssertEqual(sut.string(forKey: preferenceKeyName), preferenceValue)
    }
}
