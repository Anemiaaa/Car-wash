import UIKit
import Darwin
import Foundation

import PlaygroundSupport

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

let queue = OperationQueue()

while(true) {
    let cars = Car.random(count: 30)
    var operations: [Operation] = []
    
    cars.forEach { $0.drive() }

    cars
        .filter { $0.isDirty }
        .forEach { carWash.take(car: $0)}

    washers.forEach { washer in
        let washing = BlockOperation {
            washer.search { car in
                guard let car = car else { return }
                
                washer.work(processable: car)
            }
        }
        
        operations.append(washing)
    }
    
    queue.addOperations(operations, waitUntilFinished: true)
    
    print("\nchief earned \(chief.money)\n")
}

