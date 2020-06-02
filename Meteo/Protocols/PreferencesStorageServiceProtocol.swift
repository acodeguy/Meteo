import Foundation

protocol PreferencesStorageServiceProtocol {
    func fetchPreferences() -> [String: Any]
    func savePreferences(_ preferences: [String: Any])
}
