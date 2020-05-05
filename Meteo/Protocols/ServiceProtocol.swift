import Foundation

protocol ServiceProtocol {
    func fetch(
        url: URL,
        using session: URLSessionProtocol,
        completionHandler: @escaping (Result<WeatherResponse, Error>
        ) -> Void)
}
