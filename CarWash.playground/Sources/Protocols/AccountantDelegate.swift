import Foundation

public protocol AccountantDelegate: AnyObject {
    
    func takeMoney(money: Float, afterTaking: () -> ())
}
