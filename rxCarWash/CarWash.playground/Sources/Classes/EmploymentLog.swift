import Foundation

public class EmploymentLog: EmploymentLogProtocol {
    
    // MARK: -
    // MARK: Variables
    
    public var log: [Accountant : [Weak<Washer>]] = [:]
    
    var chief: Chief
    
    // MARK: -
    // MARK: Initialization
    
    public init(chief: Chief) {
        self.chief = chief
    }
    
    // MARK: -
    // MARK: Public
    
    public func getSupervizor<subordinateType: WorkerType>(subordinate: subordinateType) -> WorkNotificable? {
        if let _ = subordinate as? Accountant {
            return self.chief
        }
        
        if let subordinate = subordinate as? Washer,
           let supervisor = self.log.first(where: { $1.first { $0.object == subordinate } != nil })?.key
        {
            return supervisor
        }
        return nil
    }
    
    // MARK: -
    // MARK: Internal
    
    public func add(supervizors: [Accountant]) {
        supervizors.forEach { self.log.updateValue([], forKey: $0) }
    }
    
    public func appoint(subordinates: inout [Washer]) {
        subordinates.forEach { subordinate in
            if var minWorkload = self.log.sorted(by: { $0.value.count < $1.value.count }).first {
                
                minWorkload.value.append(Weak(object: subordinate))
                
                self.log.updateValue(minWorkload.value, forKey: minWorkload.key)
            }
        }
    }
    
    public func remove(worker: WorkerType) {
        if let supervisor = worker as? Accountant,
           let index = self.log.index(forKey: supervisor),
           var values = self.log[supervisor]?.compactMap({ $0.object })
        {
            self.log.remove(at: index)
            
            self.appoint(subordinates: &values)
            return
        }
        
        if let subordinate = worker as? Washer,
           let supervisor = self.getSupervizor(subordinate: subordinate) as? Accountant,
           let row = self.log[supervisor]
        {
            self.log[supervisor]?.removeAll { worker in
                row.contains { $0.object == subordinate }
            }
        }
    }
}
