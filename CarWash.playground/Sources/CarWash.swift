import Foundation

public class CarWash {
    
    // MARK: -
    // MARK: Variables
    
    private var washers: [Washer] = []
    private var accountants: [Accountant] = []
    private(set) var priceWaterLiter: Float
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
    
    public func hire(washer: Washer) {
        washer.workPlace = self
        
        self.washers.append(washer)
    }
    
    public func hire(accountant: Accountant) {
        accountant.workPlace = self
        
        self.accountants.append(accountant)
    }
    
    public func service(car: Car) {
        washers.randomElement()?.service(car: car)
    }
}
