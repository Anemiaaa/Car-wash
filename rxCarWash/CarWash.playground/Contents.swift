import UIKit
import Foundation

import PlaygroundSupport

let chief = Chief()

var accountants: [Accountant] = (1...7).map { _ in
    Accountant.random()
}

var washers: [Washer] = (1...20).map { _ in
    Washer.random()
}

let controller = CarWashController(
    chief: chief,
    washers: &washers,
    accountants: &accountants,
    priceWaterLiter: 5
)

controller.startWork()
