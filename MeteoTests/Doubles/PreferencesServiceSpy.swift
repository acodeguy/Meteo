@testable import Meteo

class PreferencesServiceSpy: PreferencesServiceProtocol {
    var numberOfTimesSetCalled = 0
    
    init() {}
    
    func set(_ value: Int, forKey defaultName: String) {
        numberOfTimesSetCalled += 1
    }
    
    func integer(forKey key: String) -> Int {
        return 0
    }
}
