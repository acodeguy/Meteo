import Foundation

// MARK: - DispatchQueueProtocol

protocol DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void)
}
