import Foundation

public class CarWash {
    
    // MARK: -
    // MARK: Variables
    
    public weak var chief: Chief?
    
    public var priceWaterLiter: Float
    public var workers: [Weak<WorkerType>] = []
    public var cars: [Weak<Car>] = []
    
    // MARK: -
    // MARK: Initialization
    
    public init(chief: Chief, priceWaterLiter: Float) {
        self.chief = chief
        self.priceWaterLiter = priceWaterLiter
        
        self.chief?.workPlace = self
    }
    
    // MARK: -
    // MARK: Public
    
    public func take(car: Car) {
        let car = Weak(object: car)
        self.cars.append(car)
    }
    
    public func remove(car: Car) {
        if let index = self.cars.firstIndex(where: { $0.object?.brand == car.brand }) {
            self.cars.remove(at: index)
        }
    }
}
