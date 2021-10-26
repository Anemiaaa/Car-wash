import Foundation

public protocol WorkNotificable {
    
    var available: Bool { get set }
    
    var lock: NSCondition { get }
    
    func didFinishWork(worker: MoneyContainable)
}
