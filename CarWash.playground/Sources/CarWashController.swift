import Foundation

public enum ChangePriceResult {
    
    case success
    case isNotGreatThanZero
}

public class CarWashController {
    
    // MARK: -
    // MARK: Variables

    public let carWash: CarWash
    
    // MARK: -
    // MARK: Initialization
    
    public init(chief: Chief, washers: inout [Washer], accountants: inout [Accountant], priceWaterLiter: Float) {
        self.carWash = CarWash(chief: chief, priceWaterLiter: priceWaterLiter)
        self.carWash.parentController = self
        
        self.hire(workers: &accountants)
        self.hire(workers: &washers)
        self.appoint(subordinates: &washers)
    }
    
    // MARK: -
    // MARK: Public
    
    public func startWork() {
        guard let chief = self.carWash.chief else { return }
        
        let queue = DispatchQueue(label: "io.washing", attributes: .concurrent)
        
        while(true) {

            let cars = Car.random(count: 20)
            
            cars.forEach { $0.drive() }

            cars
                .filter { $0.isDirty }
                .forEach { self.take(car: $0)}
            
            self.carWash.employmentLog.workers
                .compactMap { $0.object as? Washer }
                .forEach { washer in
                    queue.async {
                        washer.search { car in
                            guard let car = car else { return }
                            
                            washer.work(processable: car)
                        }
                    }
                }
            
            sleep(5)
            
            print("\nchief earned \(chief.money)\n")
        }
    }
    
    public func take(car: Car) {
        let car = Weak(object: car)
        
        self.carWash.cars.mutate({ cars in
            cars.append(car)
        })
    }
    
    public func remove(car: Car) {
        self.carWash.cars.mutate({ cars in
            cars.removeAll(where: { $0.object == car })
        })
    }
    
    public func hire<Action: MoneyContainable, WorkerType: Worker<Action>>(
        workers: inout [WorkerType]
    ) {
        workers.forEach { element in
            element.workPlace = self.carWash
        
            self.carWash.employmentLog.workers.append(Weak(object: element))
            
            if let accountant = element as? Accountant {
                self.carWash.employmentLog.add(supervizors: [accountant])
                accountant.delegate = self.carWash.chief
            }
        }
    }
    
    public func fire(workers: [WorkerType]) {
        workers.forEach { worker in
            self.carWash.employmentLog.workers.removeAll { worker in
                workers.contains { worker.object?.id == $0.id }
            }
            self.carWash.employmentLog.remove(worker: worker)
        }
    }
    
    public func change(literPrice: Float) -> ChangePriceResult {
        let isPositive = literPrice > 0

        if isPositive {
            self.carWash.priceWaterLiter = literPrice
        }
        
        return isPositive ? .success : .isNotGreatThanZero
    }
    
    public func appoint(subordinates: inout [Washer]) {
        self.carWash.employmentLog.appoint(subordinates:  &subordinates)
    }
    
    public func printConsole(text: String) {
        print(text)
    }
}
