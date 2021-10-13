import Foundation

public class Washer: Worker, BillCalculate {

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
    
    public func calculate(size: CarSize, literPrice: Float) -> Float {
        let bill: Float
        
        if size == .small {
            bill = literPrice * Float.random(in: 35..<50) + 100
        } else if size == .standard {
            bill = literPrice * Float.random(in: 50..<70) + 150
        } else {
            bill = literPrice * Float.random(in: 70..<90) + 250
        }
        return bill
    }
    
    // MARK: -
    // MARK: Private
    
    private func clean(car: Car) -> Bool {
        if !car.isDirty {
            print("Car \(car.brand) is clean .- .")
            return false
        }
        
        let bill = calculate(size: car.size, literPrice: workPlace?.priceWaterLiter ?? 5)
        
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
