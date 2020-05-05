import Foundation
@testable import Meteo

class WeatherAPIServiceStub: ServiceProtocol {
    func fetch(
        url: URL,
        using session: URLSession,
        completionHandler: @escaping (Result<WeatherResponse, Error>
        ) -> Void) {
        guard let jsonData = Constants.API.jsonResponseExample.data(using: .utf8) else { return }
        
        do {
            let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: jsonData)
            completionHandler(.success(weatherResponse))
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
