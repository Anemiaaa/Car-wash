import Foundation

public protocol Money {
    
    var money: Float { get set }
    
    func moneyOperation(money: Float, beforeTaking: (() -> ())?) 
}
