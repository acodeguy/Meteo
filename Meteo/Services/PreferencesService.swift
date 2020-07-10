import Foundation

class PreferencesService: PreferencesServiceProtocol {
    private var preferences: [String: Any] = [:]
        
    func set(_ value: Int, forKey key: String) {
        preferences[key] = value
    }
    
    func integer(forKey key: String) -> Int {
        if let value = preferences[key] as? Int {
            return value
        } else {
            return 0
        }
    }
}
