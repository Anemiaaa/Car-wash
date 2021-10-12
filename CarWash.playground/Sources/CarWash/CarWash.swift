import Foundation

public class CarWash {
    
    // MARK: -
    // MARK: Variables
    
    public var workers: [Worker] = []
    public var priceWaterLiter: Float
    
    private(set) var chief: Chief
    
    // MARK: -
    // MARK: Initialization
    
    public init(chief: Chief, priceWaterLiter: Float) {
        self.chief = chief
        self.priceWaterLiter = priceWaterLiter
        
        self.chief.workPlace = self
    }
    
    // MARK: -
    // MARK: Public
    
    public func hire(workers: [Worker]) {
        self.chief.hire(workers: workers)
    }
    
    public func service(car: Car) {
        
    }
}
