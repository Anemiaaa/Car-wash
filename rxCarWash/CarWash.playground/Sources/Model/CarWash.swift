import Foundation

public class CarWash {
    
    // MARK: -
    // MARK: Variables
    
    public weak var parentController: CarWashController?
    
    public var priceWaterLiter: Float
    public var cars = Atomic<[Weak<Car>]>([])
    
    // MARK: -
    // MARK: Initialization
    
    public init(chief: Chief, priceWaterLiter: Float) {
        self.priceWaterLiter = priceWaterLiter
        
        self.parentController?.employmentLog.chief = chief
        self.parentController?.employmentLog.chief?.workPlace = self
    }
    
    // MARK: -
    // MARK: Public
    
//    public func take(car: Car) {
//        let car = Weak(object: car)
//        self.cars.append(car)
//    }
//    
//    public func remove(car: Car) {
//        self.cars.removeAll { $0.object == car }
//    }
}
