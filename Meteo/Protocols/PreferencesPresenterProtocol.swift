protocol PreferencesPresenterProtocol {
    var view: PreferencesViewProtocol { get set }
    var preferencesService: PreferencesServiceProtocol { get set }
    init(view: PreferencesViewProtocol, preferencesService: PreferencesServiceProtocol)
    func displayPreferences()
}
