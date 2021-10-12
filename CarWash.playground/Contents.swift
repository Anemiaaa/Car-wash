import UIKit

var cars: [Car] = []

let sizes = [CarSize.small, CarSize.standard, CarSize.large]

(1...30).forEach { _ in
    cars.append(Car(
                    brand: "Random Brand \(Int.random(in: 0 ..< 1000))",
                    size: sizes[Int.random(in: 0 ..< sizes.count)],
                    money: Float.random(in: 300...1000))
    )
}

cars.forEach { $0.drive() }

let dirtyCars = cars.filter{ $0.isDirty == true }

let chief = Chief()
let carWash = CarWash(chief: chief, priceWaterLiter: 5)

(1 ... 10).forEach { _ in
    let accountant = Accountant()
    let washer = Washer()

    washer.delegate = accountant

    carWash.hire(accountant: accountant)
    carWash.hire(washer: washer)
}

dirtyCars.forEach { dirtyCar in
    carWash.service(car: dirtyCar)
}



