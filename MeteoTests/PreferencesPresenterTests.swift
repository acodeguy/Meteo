import XCTest
@testable import Meteo

class PreferencesPresenterTests: XCTestCase {
    func testCallsDisplayPreferencesOnItsView() {
        let view = PreferencesViewSpy()
        let preferencesService = PreferencesServiceDummy()
        let sut = PreferencesPresenter(view: view, preferencesService: preferencesService)
        
        sut.displayPreferences()
        
        XCTAssertEqual(view.numberOfTimesDisplayPreferencesCalled, 1)
    }
}
