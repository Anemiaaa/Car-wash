import UIKit

var cars: [Car] = []

Car.random(count: 30).forEach { car in
    cars.append(car)
}

cars.forEach { $0.drive() }

let dirtyCars = cars.filter { $0.isDirty }

let chief = Chief()
let carWash = CarWash(chief: chief, priceWaterLiter: 5)

var accountants: [Worker] = (1...7).map { _ in
    let accountant  = Accountant.random()
    
    return accountant
}

carWash.hire(workers: &accountants)

var washers: [Worker] = (1...20).map { _ in
    var washer = Washer.random()
    chief.appointAccountant(to: &washer)

    return washer
}

carWash.hire(workers: &washers)

dirtyCars.forEach { car in
    carWash.take(car: car)
}

washers.forEach { $0.work() }

print("chief earned \(chief.money)")



