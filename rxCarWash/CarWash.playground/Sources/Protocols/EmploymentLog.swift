import Foundation

public protocol EmploymentLogProtocol {
    
    var log: [Accountant : [Weak<Washer>]] { get set }
    
    func getSupervizor<subordinateType: WorkerType>(subordinate: subordinateType) -> WorkNotificable?
    
    func appoint(subordinates: inout [Washer])
    
    func add(supervizors: [Accountant])
    
    func remove(worker: WorkerType)
}
