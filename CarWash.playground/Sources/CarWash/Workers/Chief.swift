import Foundation

public class Chief: Worker<Accountant>, WorkNotificable {
    
    // MARK: -
    // MARK: Variables

    var employmentLog = EmploymentLog()

    // MARK: -
    // MARK: Public
    
    public func hire(workers: inout [MoneyContainable]) {
        workers.forEach { element in
            if let worker = element as? Worker {
                worker.workPlace = self.workPlace
                self.workPlace?.workers.append(Weak(object: worker))
            }
        }
    }
    
    public func fire(workers: [MoneyContainable]) {
        workers.forEach { worker in
            if let index = self.workPlace?.workers.firstIndex(where: { ($0.object as? Worker)?.id == (worker as? Worker)?.id }) {
                self.workPlace?.workers.remove(at: index)
            }
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
    
    func didFinishWork(worker: MoneyContainable) {
        worker.money = 0
    }
    
    // MARK: -
    // MARK: Overriden
    
    override func process(processable: Accountant) {
        if processable.money > 0 {
            self.money += processable.money
        }
    }
    
}

