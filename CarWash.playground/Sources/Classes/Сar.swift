import Foundation

public enum CarSize {
    
    case small
    case standard
    case large
}

public class Car: MoneyContainable {
    
    // MARK: -
    // MARK: Variables
    
    public let size: CarSize
    public let brand: String
    
    public var isDirty = false
    
    // MARK: -
    // MARK: Initialization
    
    public init(brand: String, money: Float, size: CarSize) {
        self.brand = brand
        self.size = size
        super.init(money: money)
    }
    
    // MARK: -
    // MARK: Public
    
    public func spend(money: Float) -> Bool {
        let moreThan = self.money >= money
        
        if moreThan {
            self.money -= money
        }
        
        return moreThan
    }
    
    public func drive() {
        if Bool.random() {
            self.isDirty = true
        }
    }
}
