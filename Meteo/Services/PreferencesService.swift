import Foundation

class PreferencesService: PreferencesServiceProtocol {
    private var preferences: [String: Any] = [:]
    
    func set(_ value: Any?, forKey key: String) {
        preferences[key] = value
    }
    
    func string(forKey key: String) -> String? {
        if let value = preferences[key] as? String {
            return value
        }
        
        return nil
    }
}
