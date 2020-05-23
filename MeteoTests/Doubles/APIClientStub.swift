import UIKit
@testable import Meteo

class APIClientStub: APIClientProtocol {
    typealias APIClientResult<T> = (Result<T, Error>) -> Void
    var session: URLSessionProtocol
    
    required init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func fetch<T: Decodable>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>) {
        session.dataTask(with: url) { data, _, _ in
            guard let jsonData = data else { return }
            
            do {
                let weatherResponse: T = try JSONDecoder().decode(T.self, from: jsonData)
                completionHandler(.success(weatherResponse))
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchRawData(from url: URL, completionHandler: @escaping DataResult) {
        if let image = UIImage(named: "swift.png") {
            if let data = image.pngData() {
                completionHandler(.success(data))
            }
        }
    }
}
