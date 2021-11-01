import Foundation

public enum CleanResult {
    
    case success
    case notEnoughMoney
    case noNeedToClean
}

public class Washer: Worker<Car> {
    
    // MARK: -
    // MARK: Public
    
    public func search(completion: (Car?) -> ()) {
        var car: Car?
        
            self.workPlace?.cars.mutate({ cars in
                car = cars.compactMap { $0.object }
                    .first(where: { $0.available } )
                
                car?.available = false
            })
        
        completion(car)
        
        car?.available = true
    }
    
    // MARK: -
    // MARK: Private
    
    private func clean(car: Car) -> CleanResult {
        if !car.isDirty {
            print("Car \(car.brand) is clean .- .")
            return .noNeedToClean
        }
        
        let price = self.calculate(size: car.size, literPrice: workPlace?.priceWaterLiter ?? 5)
        
        if car.spend(money: price) == .success {
            sleep(1)
            car.isDirty = false
            
            print("\(car.brand) was washed")
            
            self.money = price
            
            return .success
        }
        print("\(car.brand) doesnt have enough money! You need another \(price - car.money)")
        
        return .notEnoughMoney
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
    
    public override func process(processable: Car) -> ProcessResult {
        let result = self.clean(car: processable)
        
        self.workPlace?.parentController?.remove(car: processable)
        
        return result == .success ? .success : .fail
    }
}