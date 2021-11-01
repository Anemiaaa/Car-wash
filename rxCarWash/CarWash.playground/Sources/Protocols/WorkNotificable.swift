import Foundation

public protocol WorkNotificable {
    
    var available: Bool { get set }
    
    var lock: NSLock { get }
    
    func didFinishWork(worker: MoneyContainable)
}
