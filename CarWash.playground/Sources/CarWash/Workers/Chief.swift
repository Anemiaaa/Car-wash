import Foundation

public class Chief: Worker<Accountant>, WorkNotificable {
    
    // MARK: -
    // MARK: Variables

    var employmentLog = EmploymentLog()

    // MARK: -
    // MARK: Public
    
    public func hire<Action: MoneyContainable, WorkerType: Worker<Action>>(
        workers: inout [WorkerType]
    ) {
        workers.forEach { element in
            element.workPlace = self.workPlace
        
            self.workPlace?.workers.append(Weak(object: element))
            
            if let accountant = element as? Accountant {
                self.employmentLog.add(supervizors: [accountant])
                accountant.delegate = self
            }
        }
    }
    
    public func fire(workers: [WorkerType]) {
        workers.forEach { worker in
            self.workPlace?.workers.removeAll { worker in
                workers.contains { worker.object?.id == $0.id }
            }
            self.employmentLog.remove(worker: worker)
        }
    }
    
    public func change(literPrice: Float) -> Bool {
        let isPositive = literPrice > 0

        if isPositive {
            self.workPlace?.priceWaterLiter = literPrice
        }
        
        return isPositive
    }
    
    public func appoint(subordinates: inout [Washer]) {
        employmentLog.appoint(subordinates:  &subordinates)
    }
    
    public func didFinishWork(worker: MoneyContainable) {
        if var accountant = worker as? Accountant {
            self.work(processable: accountant)
            worker.money = 0
        }
    }
    
    // MARK: -
    // MARK: Overriden
    
    public override func process(processable: Accountant) {
        if processable.money > 0 {
            self.money += processable.money
        }
    }
}

