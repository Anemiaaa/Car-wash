import Foundation

public protocol Worker: AnyObject {
    
    var workPlace: CarWash? { get set }
    
    func work()
}
