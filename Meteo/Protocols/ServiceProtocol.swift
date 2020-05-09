import Foundation

protocol ServiceProtocol {
    var session: URLSessionProtocol { get set }
    
    init(session: URLSessionProtocol)
    
    func fetch(url: URL, completionHandler: @escaping (Result<WeatherResponse, Error>) -> Void)
}
