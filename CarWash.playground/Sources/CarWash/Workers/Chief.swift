import Foundation

public class Chief: Money {
    
    // MARK: -
    // MARK: Variables
    
    weak var workPlace: CarWash?
    weak var employmentLog: EmploymentLog
    
    public var money: Float = 0
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func moneyOperation(money: Float, beforeTaking: (() -> ())?) {
        beforeTaking?()
        
        self.money += money
    }
    
    public func hire(workers: inout [Worker]) {
        (0..<workers.count).forEach { index in
            workers[index].workPlace = self.workPlace
            
            self.workPlace?.workers.append(Weak(object: workers[index]))
        }
    }
    
    public func fire(workers: [Worker]) {
        workers.forEach { worker in
            if let index = self.workPlace?.workers.firstIndex(where: { $0.object?.id == worker.id }) {
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
    
    public func appointAccountant(to washer: inout Washer) {
        let accountant = self.workPlace?
            .accountants
            .compactMap { $0.object }
            .sorted { $0.workload < $1.workload }
            .first
        
        washer.delegate = accountant
        accountant?.workload += 1
    }
}

