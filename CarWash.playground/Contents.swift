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

class Observer {
    
    let observables: [Observable]
    let disposeBag = DisposeBag()
    
    init(observables: [Observable]) {
        self.observables = observables
    }
    
    func prepareObserving() {
        self.observables.forEach {
            $0.publishSubject.bind {
                switch $0 {
                case .didFinishSomething(let value):
                    print(value)
                }
            }
            .disposed(by: self.disposeBag)
        }
    }
}

enum States {
    
    case didFinishSomething(Int)
}

class Observable {
    
    let publishSubject = PublishSubject<States>()
    
    func work() {
        self.publishSubject.onNext(.didFinishSomething(1 + 1))
    }
}
