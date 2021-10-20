import Foundation

public class Washer: Worker<Car>, WorkNotificable {
    
    // MARK: -
    // MARK: Public
    
    //???
    public func search() -> Car? {
        if let cars = self.workPlace?.cars {
            return cars.randomElement()?.object
        }
        return nil
    }
    
    public func didFinishWork(worker: MoneyContainable) {
        //???
    }
    
    // MARK: -
    // MARK: Private
    
    private func clean(car: Car) -> Bool {
        if !car.isDirty {
            print("Car \(car.brand) is clean .- .")
            return false
        }
        
        let price = calculate(size: car.size, literPrice: workPlace?.priceWaterLiter ?? 5)
        
        if car.spend(money: price) {
            car.isDirty = false
            
            print("\(car.brand) was washed")
            
            self.money = price
            
            return true
        }
        print("\(car.brand) doesnt have enough money! You need another \(price - car.money)")
        
        return false
    }
    
    private func calculate(size: CarSize, literPrice: Float) -> Float {
        let bill: Float
        
        switch size {
            case .small:
                bill = literPrice * Float.random(in: 35..<50) + 100
            case .standard:
                bill = literPrice * Float.random(in: 50..<70) + 150
            case .large:
                bill = literPrice * Float.random(in: 70..<90) + 250
        }
            
        return bill
    }
    
    // MARK: -
    // MARK: Overriden
    
    public override func process(processable: Car) {
        if self.clean(car: processable) {
            self.workPlace?.remove(car: processable)
        }
    }
}
