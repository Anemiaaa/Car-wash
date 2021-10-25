import UIKit
import Darwin

let chief = Chief()
let carWash = CarWash(chief: chief, priceWaterLiter: 5)

var accountants: [Accountant] = (1...7).map { _ in
    Accountant.random()
}

chief.hire(workers: &accountants)

var washers: [Washer] = (1...20).map { _ in
    Washer.random()
}

chief.hire(workers: &washers)

chief.appoint(subordinates: &washers)

while(true) {
    let cars = Car.random(count: 30)
    
    cars.forEach { $0.drive() }

    cars
        .filter { $0.isDirty }
        .forEach { carWash.take(car: $0)}

    washers.forEach { washer in
        sleep(1)
        
        if let car = washer.search() {
            washer.work(processable: car)
        }
    }

    print("\nchief earned \(chief.money)\n")
}

