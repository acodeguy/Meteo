import XCTest
@testable import Meteo

class PreferencesServiceTests: XCTestCase {
    private var sut: PreferencesServiceProtocol!
    
    override func setUp() {
        sut = PreferencesService()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testRetrievessAnIntegerValue() {
        let expectedValue: Int = 987
        sut.set(expectedValue, forKey: "test")
        
        let retrievedValue: Int = sut.integer(forKey: "test")
        
        XCTAssertEqual(retrievedValue, expectedValue)
    }
    
    func testReturns0IfTheIntegerKeyDoesNotExist() {
        let expectedValue: Int = 0
        
        let retreivedValue = sut.integer(forKey: "nonexistent")
        
        XCTAssertEqual(retreivedValue, expectedValue)
    }
}
