import Foundation

struct Weather: Decodable {   
    let temperature: Double
    let state: String
    let stateAbbreviation: String
    
    private enum CodingKeys: String, CodingKey {
        case state = "weather_state_name"
        case stateAbbreviation = "weather_state_abbr"
        case temperature = "the_temp"
    }
}
