import Foundation

protocol APIClientProtocol {
    typealias APIClientResult<T> = (Result<T, Error>) -> Void
    typealias DataResult = (Result<Data, Error>) -> Void
    var session: URLSessionProtocol { get set }
    var jsonParser: JSONParserProtocol { get set }
    init(session: URLSessionProtocol, jsonParser: JSONParserProtocol)
    func fetch<T: Decodable>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>)
    func fetchRawData(from url: URL, completionHandler: @escaping DataResult)
}

class APIClient: APIClientProtocol {
    typealias APIClientResult<T> = (Result<T, Error>) -> Void
    var session: URLSessionProtocol
    var jsonParser: JSONParserProtocol
    
    required init(session: URLSessionProtocol, jsonParser: JSONParserProtocol) {
        self.session = session
        self.jsonParser = jsonParser
    }
    
    func fetch<T: Decodable>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>) {
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(error!))
                return
            }
                        
            let result = self.jsonParser.parse(type: T.self, from: data)
            switch result {
            case .success(let json):
                completionHandler(.success(json))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    func fetchRawData(from url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            completionHandler(.success(data))
            return
        }.resume()
    }
}
