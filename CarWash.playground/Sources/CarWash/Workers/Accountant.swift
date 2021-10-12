import Foundation

public class Accountant: Worker, AccountantDelegate {
    
    // MARK: -
    // MARK: Variables
    
    public weak var workPlace: CarWash?
    public var money: Float = 0
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public

    public func takeMoney(money: Float, afterTaking: () -> ()) {
        self.money = money
        
        afterTaking()
        
        self.calculate()
    }
    
    // MARK: -
    // MARK: Private
    
    private func handOverMoney() {
        self.workPlace?.chief.earn(money: money)
    }
    
    private func calculate() {
        let changedMoney = money / 100 * 75
        self.money = changedMoney
        
        self.handOverMoney()
    }
}
