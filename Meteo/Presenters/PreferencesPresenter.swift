class PreferencesPresenter: PreferencesPresenterProtocol {
    var view: PreferencesViewProtocol
    var preferencesService: PreferencesServiceProtocol
    
    required init(view: PreferencesViewProtocol, preferencesService: PreferencesServiceProtocol) {
        self.view = view
        self.preferencesService = preferencesService
    }
    
    func displayPreferences() {
        view.displayPreferences()
    }
}
