// swiftlint:disable type_name
import Foundation

protocol JSONParserProtocol {
    var decoder: JSONDecoderProtocol { get set }
    typealias T = Decodable
    func parse<T: Decodable>(type: T.Type, from data: Data) -> Result<T, Error>
    init(decoder: JSONDecoderProtocol)
}
