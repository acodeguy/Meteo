protocol PreferencesServiceProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey key: String) -> Int
    
}
