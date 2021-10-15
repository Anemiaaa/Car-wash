import Foundation

public class Accountant: Worker, Money {
    
    // MARK: -
    // MARK: Variables
    
    public weak var workPlace: CarWash?
    
    public var workload: Int = 0
    public var money: Float = 0 //{
//        didSet {
//            self.work()
//        }
//    }
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func work() {
        if self.money > 0 {
            let changedMoney = money / 100 * 75
            self.money = changedMoney
            
            self.workPlace?.chief?.moneyOperation(money: self.money, beforeTaking: {
                self.money = 0
            })
        }
    }
    
    public func moneyOperation(money: Float, beforeTaking: (() -> ())?) {
        beforeTaking?()
        
        self.money = money
        self.work()
    }
}
