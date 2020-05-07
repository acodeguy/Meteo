import Foundation
@testable import Meteo

class WeatherAPIServiceStub: ServiceProtocol {
    var session: URLSessionProtocol
    
    required init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func fetch(
        url: URL,
        completionHandler: @escaping (Result<WeatherResponse, Error>
        ) -> Void) {
        session.dataTask(with: url) { data, _, _ in
            guard let jsonData = data else { return }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: jsonData)
                completionHandler(.success(weatherResponse))
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
