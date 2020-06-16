protocol PreferencesServiceProtocol {
    func set(_ value: Any?, forKey key: String)
    func string(forKey key: String) -> String?
}
