import XCTest
@testable import Meteo

class DateExtensionsTests: XCTestCase {
    func testToShortTimesReturnsCorrectlyFormattedString() {
        let date = Date()
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0
        
        let timeString = date.toShortTime()
        
        XCTAssertEqual(timeString, "\(hour):\(minute):\(second)")
    }
}
