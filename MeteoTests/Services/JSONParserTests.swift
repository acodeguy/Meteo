import XCTest
@testable import Meteo

class JSONParserTests: XCTestCase {
    private var parser: JSONParserProtocol!
    
    override func setUp() {
        parser = JSONParser(decoder: JSONDecoder())
    }
    
    override func tearDown() {
        parser = nil
    }
    
    func testParsesDataToTheCorrectType() {
        let dataFromAPI = Constants.API.jsonResponseExample.data(using: .utf8)!
        
        let jsonResult = parser.parse(type: WeatherResponse.self, from: dataFromAPI)
        switch jsonResult {
        case .success(let json):
            XCTAssertEqual(json.title, "Rome")
        default:
            break
        }
    }
    
    func testReturnsAnError() {
        let badDataFromAPI = "badbadbad".data(using: .utf8)!
        
        let jsonResult = parser.parse(type: WeatherResponse.self, from: badDataFromAPI)
        switch jsonResult {
        case .failure(let error):
            XCTAssertNotNil(error)
        default:
            break
        }
    }
}
