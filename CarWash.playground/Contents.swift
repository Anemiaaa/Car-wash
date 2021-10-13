import UIKit

var cars: [Car] = []

(1...30).forEach { _ in
    cars.append(Car.random())
}

cars.forEach { $0.drive() }

let dirtyCars = cars.filter { $0.isDirty }

let chief = Chief()
let carWash = CarWash(chief: chief, priceWaterLiter: 5)

let accountants: [Worker] = (1...7).map { _ in
    let accountant  = Accountant.random()
    accountant.workPlace = carWash

    return accountant
}

let washers: [Worker] = (1...20).map { _ in
    let washer = Washer.random()
    washer.delegate = accountants.randomElement() as? AccountantDelegate
    washer.workPlace = carWash

    return washer
}

var workers = [washers, accountants].flatMap { $0 }
carWash.hire(workers: &workers )

dirtyCars.forEach { car in
    carWash.service(car: car)
}

print("chief earned \(chief.money)")



