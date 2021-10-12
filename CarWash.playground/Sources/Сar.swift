import Foundation

public enum CarSize {
    
    case small
    case standard
    case large
}

public class Car {
    
    // MARK: -
    // MARK: Variables
    
    public let size: CarSize
    public let brand: String
    
    public var isDirty = false
    public var money: Float
    
    // MARK: -
    // MARK: Initialization
    
    public init(brand: String, money: Float, size: CarSize) {
        self.brand = brand
        self.money = money
        self.size = size
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
