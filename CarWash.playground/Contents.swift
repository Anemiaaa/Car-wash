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
    Accountant.random()
}

let washers: [Worker] = (1...20).map { _ in
    let washer = Washer.random()
    washer.delegate = accountants.randomElement() as? AccountantDelegate
    
    return washer
}

carWash.hire(workers: <#T##[Worker]#>)

dirtyCars.forEach { car in
    carWash.service(car: car)
}



