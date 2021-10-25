import Foundation

class EmploymentLog {
    
    // MARK: -
    // MARK: Variables
    
    public var workers: [Weak<WorkerType>] = []
    var log: [Accountant : [Weak<Washer>]] = [:]
    
    // MARK: -
    // MARK: Internal
    
    func add(supervizors: [Accountant]) {
        supervizors.forEach { self.log.updateValue([], forKey: $0) }
    }
    
    func appoint(subordinates: inout [Washer]) {
        subordinates.forEach { subordinate in
            if var minWorkload = self.log.sorted(by: { $0.value.count < $1.value.count }).first {
                subordinate.delegate = minWorkload.key
                
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
           let supervisor = subordinate.delegate as? Accountant,
           let row = self.log[supervisor]
        {
            self.log[supervisor]?.removeAll { worker in
                row.contains { $0.object == subordinate }
            }
        }
    }
}
