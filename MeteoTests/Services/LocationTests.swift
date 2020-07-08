import XCTest
@testable import Meteo

class LocationTests: XCTestCase {
    func testIsCreatedWithTheGivenLongitudeAndLatitude() {
        let latitude = 10.0
        let longitude = 20.0
        
        let sut = Location(latitude: latitude, longitude: longitude)
        
        XCTAssertEqual(sut.latitude, latitude)
        XCTAssertEqual(sut.longitude, longitude)
    }
}
