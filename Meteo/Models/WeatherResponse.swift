import Foundation

struct WeatherResponse: Decodable {
    let title: String
    let weather: [Weather]
    let locationInfo: ParentLocation
    
    private enum CodingKeys: String, CodingKey {
        case locationInfo = "parent"
        case title
        case weather = "consolidated_weather"
    }
}

struct ParentLocation: Codable {
    let countryName: String
    
    private enum CodingKeys: String, CodingKey {
        case countryName = "title"
    }
}
