import Foundation

class WeatherAPIService: ServiceProtocol {
    func fetch(
        url: URL,
        using session: URLSession = .shared,
        completionHandler: @escaping (Result<WeatherResponse, Error>) -> Void
    ) {
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(error!))
                return
            }
                        
            do {
                let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
                
                completionHandler(.success(response))
            } catch let error {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}
