import Foundation

struct Weather: Decodable {   
    let temperature: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "the_temp"
    }
}
