import XCTest
@testable import Meteo

class PreferencesPresenterTests: XCTestCase {
    func testCallsSetDisplayOnItsView() {
        let view = PreferencesViewSpy()
        let preferencesService = PreferencesServiceDummy()
        let sut = PreferencesPresenter(view: view, preferencesService: preferencesService)
        
        sut.setDisplay()
        
        XCTAssertEqual(view.numberOfTimesDisplayPreferencesCalled, 1)
    }
}
