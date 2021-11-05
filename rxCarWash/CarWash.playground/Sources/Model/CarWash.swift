import Foundation

public class CarWash {
    
    // MARK: -
    // MARK: Variables
    
    public var priceWaterLiter: Float
    public var cars = Atomic<[Weak<Car>]>([])
    
    // MARK: -
    // MARK: Initialization
    
    public init(priceWaterLiter: Float) {
        self.priceWaterLiter = priceWaterLiter
    }
}
