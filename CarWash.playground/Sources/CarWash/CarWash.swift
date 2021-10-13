import Foundation

public class CarWash {
    
    // MARK: -
    // MARK: Variables
    
    public var workers: [Worker] = []
    public var priceWaterLiter: Float
    public var chief: Chief
    
    // MARK: -
    // MARK: Initialization
    
    public init(chief: Chief, priceWaterLiter: Float) {
        self.chief = chief
        self.priceWaterLiter = priceWaterLiter
        
        self.chief.workPlace = self
    }
    
    // MARK: -
    // MARK: Public
    
    public func hire(workers: inout [Worker]) {
        self.chief.hire(workers: &workers)
    }
    
    public func service(car: Car) {
        let washer: [Washer] = self.workers.compactMap { $0 as? Washer }
        washer.randomElement()?.service(car: car)
    }
}
