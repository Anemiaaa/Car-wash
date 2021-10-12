import Foundation

public enum CarSize {
    
    case small
    case standard
    case large
}

public class Car {
    
    // MARK: -
    // MARK: Variables
    
    public var isDirty = false
    
    var money: Float
    
    let size: CarSize
    let brand: String
    
    // MARK: -
    // MARK: Initialization
    
    public init(brand: String, size: CarSize, money: Float) {
        self.brand = brand
        self.size = size
        self.money = money
    }
    
    // MARK: -
    // MARK: Public
    
    public func spend(money: Float) -> Bool {
        if self.money >= money {
            self.money -= money
            
            return true
        } else {
            return false
        }
    }
    
    public func drive() {
        if Bool.random() {
            self.isDirty = true
        }
    }
}
