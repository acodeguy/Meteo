import CoreLocation
import XCTest
@testable import Meteo

class LocationServiceTests: XCTestCase {
    func testGetCurrentLocationReturnsExpectedLocation() {
        let expectedLocation = CLLocation(latitude: 52, longitude: 89)
        let locationManagerMock = LocationManagerMock()
        locationManagerMock.location = { expectedLocation }
        let sut = LocationService(manager: locationManagerMock)
        let completionExpectation = expectation(description: "completion block expectation")
        
        sut.getCurrentLocation { location in
            completionExpectation.fulfill()
            
            XCTAssertEqual(location.latitude, expectedLocation.latitude)
            XCTAssertEqual(location.longitude, expectedLocation.longitude)
        }
        wait(for: [completionExpectation], timeout: 3)
    }
}
