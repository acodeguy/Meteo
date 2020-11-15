protocol PreferencesPresenterProtocol {
    var view: PreferencesViewProtocol { get set }
    var preferencesService: PreferencesServiceProtocol { get set }
    init(view: PreferencesViewProtocol, preferencesService: PreferencesServiceProtocol)
    func setDisplay()
    func savePreference(value: Int, forKey key: String)
}
