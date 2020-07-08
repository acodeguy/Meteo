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
    
    func testCallsSetOnItsPreferenceService() {
        let view = PreferencesViewDummy()
        let preferencesServiceSpy = PreferencesServiceSpy()
        let sut = PreferencesPresenter(view: view, preferencesService: preferencesServiceSpy)
        
        sut.savePreference(value: 0, forKey: "")
        
        XCTAssertEqual(preferencesServiceSpy.numberOfTimesSetCalled, 1)
    }
}
