import Foundation

public class Washer: Worker, Money {

    // MARK: -
    // MARK: Variables

    public weak var delegate: Accountant?
    public var money: Float = 0
    
    weak public var workPlace: CarWash?
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func work() {
        if let car = self.search() {
            if clean(car: car) {
                self.workPlace?.remove(car: car)
                self.moneyOperation(money: self.money, beforeTaking: nil)
            }
        }
    }
    
    public func moneyOperation(money: Float, beforeTaking: (() -> ())?) {
        beforeTaking?()

        self.delegate?.moneyOperation(money: self.money, beforeTaking: {
            self.money = 0
        })
    }
    
    
    // MARK: -
    // MARK: Private
    
    private func search() -> Car? {
        if let cars = self.workPlace?.cars {
            return cars.randomElement()?.object
        }
        return nil
    }
    
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
    
    private func calculate(size: CarSize, literPrice: Float) -> Float {
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
}
