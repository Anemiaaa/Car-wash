import Foundation

class EmploymentLog {
    
    // MARK: -
    // MARK: Variables
    
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
    
    func remove(worker: MoneyContainable) -> Bool {
        if let supervisor = worker as? Accountant,
           let index = self.log.index(forKey: supervisor),
           var values = self.log[supervisor]?.compactMap({ $0.object })
        {
            self.log.remove(at: index)
            
            self.appoint(subordinates: &values)
                
            return true
        }
        
        if let subordinate = worker as? Washer,
           let supervisor = subordinate.delegate as? Accountant
        {
            if let index = self.log[supervisor]?.firstIndex(where: { $0.object == subordinate  }) {
                self.log[supervisor]?.remove(at: index)
                
                return true
            }
        }
        return false
    }
}
