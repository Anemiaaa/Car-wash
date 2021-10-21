import Foundation

public enum CarSize {
    
    case small
    case standard
    case large
}

public class Car: MoneyContainable, Equatable {
    
    // MARK: -
    // MARK: Variables
    
    public let id: UUID
    public let size: CarSize
    public let brand: String
    
    public var money: Float
    public var isDirty = false
    
    // MARK: -
    // MARK: Initialization
    
    public init(brand: String, money: Float, size: CarSize) {
        self.brand = brand
        self.size = size
        self.money = money
        self.id = UUID()
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
    
    // MARK: -
    // MARK: Equatable
    
    public static func == (lhs: Car, rhs: Car) -> Bool {
        lhs.id == rhs.id
    }
}
