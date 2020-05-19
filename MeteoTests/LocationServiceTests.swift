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
            
            XCTAssertEqual(location.coordinate.latitude, expectedLocation.coordinate.latitude)
            XCTAssertEqual(location.coordinate.longitude, expectedLocation.coordinate.longitude)
        }
        wait(for: [completionExpectation], timeout: 3)
    }
}
