import Foundation

struct WeatherResponse: Decodable {
    let title: String
    let weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case weather = "consolidated_weather"
    }
}
