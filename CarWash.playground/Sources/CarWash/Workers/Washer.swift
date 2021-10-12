import Foundation

public class Washer: Worker {

    // MARK: -
    // MARK: Variables

    public weak var delegate: AccountantDelegate?
    public var money: Float = 0
    
    weak public var workPlace: CarWash?
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func service(car: Car) {
        if clean(car: car) {
            self.handOverMoney()
        }
    }
    
    public func handOverMoney() {
        self.delegate?.takeMoney(money: self.money, afterTaking: {
            self.money = 0
        })
    }
    
    // MARK: -
    // MARK: Private
    
    private func clean(car: Car) -> Bool {
        if !car.isDirty {
            print("Car \(car.brand) is clean .- .")
            return false
        }
        
        let bill = BillCalculate.calculate(size: car.size, literPrice: workPlace?.priceWaterLiter)
        
        if car.spend(money: bill) {
            car.isDirty = false
            
            print("\(car.brand) was washed")
            
            self.money = bill
            
            return true
        }
        print("\(car.brand) doesnt have enough money! You need another \(bill - car.money)")
        
        return false
    }
}
