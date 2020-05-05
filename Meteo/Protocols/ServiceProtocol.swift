import Foundation

protocol ServiceProtocol {
    func fetch(
        url: URL,
        using session: URLSession,
        completionHandler: @escaping (Result<WeatherResponse, Error>
        ) -> Void)
}
