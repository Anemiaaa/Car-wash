import UIKit

var cars = Car.random(count: 30)

cars.forEach { $0.drive() }

let dirtyCars = cars.filter { $0.isDirty }

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

dirtyCars.forEach { car in
    carWash.take(car: car)
}

washers.forEach { washer in
    if let car = washer.search() {
        washer.work(processable: car)
    }
}

print("chief earned \(chief.money)")

