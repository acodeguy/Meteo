import Foundation

protocol APIClientProtocol {
    typealias APIClientResult<T> = (Result<T, Error>) -> Void
    var session: URLSessionProtocol { get set }
    init(session: URLSessionProtocol)
    func fetch<T: Decodable>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>)
}
