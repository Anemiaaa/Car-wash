import Foundation

public enum ChangePriceResult {
    
    case success
    case isNotGreatThanZero
}

public class Chief: Manager<Accountant> {

    // MARK: -
    // MARK: Public
    
    public func hire<Action: MoneyContainable, WorkerType: Worker<Action>>(
        workers: inout [WorkerType]
    ) {
        workers.forEach { element in
            element.workPlace = self.workPlace
        
            self.workPlace?.employmentLog.workers.append(Weak(object: element))
            
            if let accountant = element as? Accountant {
                self.workPlace?.employmentLog.add(supervizors: [accountant])
                accountant.delegate = self
            }
        }
    }
    
    public func fire(workers: [WorkerType]) {
        workers.forEach { worker in
            self.workPlace?.employmentLog.workers.removeAll { worker in
                workers.contains { worker.object?.id == $0.id }
            }
            self.workPlace?.employmentLog.remove(worker: worker)
        }
    }
    
    public func change(literPrice: Float) -> ChangePriceResult {
        let isPositive = literPrice > 0

        if isPositive {
            self.workPlace?.priceWaterLiter = literPrice
        }
        
        return isPositive ? .success : .isNotGreatThanZero
    }
    
    public func appoint(subordinates: inout [Washer]) {
        self.workPlace?.employmentLog.appoint(subordinates:  &subordinates)
    }
    
    // MARK: -
    // MARK: Overriden
    
    public override func process(processable: Accountant) {
        if processable.money > 0 {
            self.money += processable.money
        }
    }
}

