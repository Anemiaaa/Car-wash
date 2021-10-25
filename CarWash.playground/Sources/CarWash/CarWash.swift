import Foundation

public class CarWash {
    
    // MARK: -
    // MARK: Variables
    
    public weak var chief: Chief? {
        didSet {
            self.employmentLog.workers
                .compactMap { $0.object as? Accountant }
                .forEach { $0.delegate = chief }
        }
    }
    
    var employmentLog = EmploymentLog()
    public var priceWaterLiter: Float
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
        self.cars.removeAll { $0.object == car }
    }
}
