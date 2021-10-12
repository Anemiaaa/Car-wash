import Foundation

public class Chief {
    
    // MARK: -
    // MARK: Variables
    
    weak var workPlace: CarWash?
    
    private var money: Float = 0
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func earn(money: Float) {
        self.money += money
    }
    
    public func hire(workers: [Worker]) {
        workers.forEach {
            self.workPlace?.workers.append($0)
        }
    }
    
    public func change(literPrice: Float) -> Bool {
        let notNull = literPrice > 0

        if notNull {
            self.workPlace?.priceWaterLiter = literPrice
        }
        
        return notNull
    }
}
