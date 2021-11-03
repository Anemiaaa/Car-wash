import Foundation

class EmploymentLog {
    
    // MARK: -
    // MARK: Variables
    
    weak var parentController: CarWashController?
    var log: [Accountant : [Weak<Washer>]] = [:]
    
    // MARK: -
    // MARK: Public
    
    public func getSupervizor<subordinateType: WorkerType>(subordinate: subordinateType) -> WorkNotificable? {
        if let _ = subordinate as? Accountant,
           let chief = self.parentController?.chief
        {
            return chief
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
    
    func add(supervizors: [Accountant]) {
        supervizors.forEach { self.log.updateValue([], forKey: $0) }
    }
    
    func appoint(subordinates: inout [Washer]) {
        subordinates.forEach { subordinate in
            if var minWorkload = self.log.sorted(by: { $0.value.count < $1.value.count }).first {
                
                minWorkload.value.append(Weak(object: subordinate))
                
                self.log.updateValue(minWorkload.value, forKey: minWorkload.key)
            }
        }
    }
    
    func remove(worker: WorkerType) {
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
