import Foundation

public class Washer {
    
    // MARK: -
    // MARK: Variables

    public weak var delegate: AccountantDelegate?
    
    weak var workPlace: CarWash?
    
    private var money: Float?
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func service(car: Car) {
        if let money = clean(car: car) {
            self.money = money
        }
    }
    
    public func handOverMoney() {
        if let money = money{
            self.delegate?.count(money: money)
            self.money = nil
        }
    }
    
    // MARK: -
    // MARK: Private
    
    private func clean(car: Car) -> Float? {
        if car.isDirty == false {
            print("Car \(car.brand) is clean .- .")
            return nil
        }
        
        let check: Float
        let literPrice = workPlace?.priceWaterLiter ?? 5
        
        if car.size == CarSize.small {
            check = literPrice * 35 + 100
        } else if car.size == CarSize.standard {
            check = literPrice * 50 + 150
        } else {
            check = literPrice * 70 + 250
        }
        
        if car.spend(money: check) {
            car.isDirty = false
            
            print("\(car.brand) was washed")
            
            return check
        }
        
        print("\(car.brand) doesnt have enough money! You need another \(check - car.money)")
        return nil
    }
}
