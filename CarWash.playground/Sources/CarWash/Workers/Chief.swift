import Foundation

public class Chief: Money {
    
    // MARK: -
    // MARK: Variables
    
    weak var workPlace: CarWash?
    
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
            
            let worker = workers[index]
            
            if let accountant =  worker as? Accountant {
                self.workPlace?.accountants.append(Weak(object: accountant))
            } else if let washer = worker as? Washer {
                self.workPlace?.washers.append(Weak(object: washer))
            }
        }
    }
    
    public func change(literPrice: Float) -> Bool {
        let notNull = literPrice > 0

        if notNull {
            self.workPlace?.priceWaterLiter = literPrice
        }
        
        return notNull
    }
    
    public func appointAccountant(to washer: inout Washer) {
        if let accountants = self.workPlace?.accountants.compactMap({ $0.object }) {
            
            if let minWorkload: Int = accountants.compactMap({ $0.workload }).min() {
                let accountantToAppointing = accountants.first { $0.workload == minWorkload }
                
                washer.delegate = accountantToAppointing
                
                accountantToAppointing?.workload += 1
            }
        }
    }
}
