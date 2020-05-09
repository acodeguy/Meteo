import Foundation
@testable import Meteo

class DispatchQueueMock: DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void) {
        work()
    }
}
