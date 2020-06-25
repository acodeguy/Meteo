import XCTest
@testable import Meteo

class JSONParserTests: XCTestCase {
    func testParsesDataToTheCorrectType() {
        let dataFromAPI = Constants.API.jsonResponseExample.data(using: .utf8)!
        let parser = JSONParser(decoder: JSONDecoder())
        
        let jsonResult = parser.parse(type: WeatherResponse.self, from: dataFromAPI)
        switch jsonResult {
        case .success(let json):
            XCTAssertEqual(json.title, "Rome")
        default:
            break
        }
    }
}
