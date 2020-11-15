import Foundation

// MARK: - JSONDecoderProtocol

protocol JSONDecoderProtocol {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}
