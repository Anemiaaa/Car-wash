import Foundation

public class Accountant: AccountantDelegate {
    
    // MARK: -
    // MARK: Variables
    
    weak var workPlace: CarWash?
    
    private var money: Float?
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func count(money: Float) {
        let changedMoney = money / 100 * 75
        
        self.money = changedMoney
    }
    
    public func handOverMoney() {
        if let money = money {
            workPlace?.chief.earn(money: money)
            self.money = nil
        }
    }
}
