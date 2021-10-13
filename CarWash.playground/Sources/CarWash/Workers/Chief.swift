import Foundation

public class Chief {
    
    // MARK: -
    // MARK: Variables
    
    weak var workPlace: CarWash?
    
    public var money: Float = 0
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func earn(money: Float) {
        self.money += money
    }
    
    public func hire(workers: inout [Worker]) {
        (0..<workers.count).forEach { index in
            self.workPlace?.workers.append(workers[index])
            workers[index].workPlace = self.workPlace
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
