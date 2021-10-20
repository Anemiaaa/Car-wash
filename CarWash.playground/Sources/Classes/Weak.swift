import Foundation

public class Weak<T: AnyObject>{
    
    // MARK: -
    // MARK: Variables

    public weak var object: T?
    
    // MARK: -
    // MARK: Initialization
    
    init (object: T) {
        self.object = object
    }
    
//    // MARK: -
//    // MARK: Public
//
//    public static func == (lhs: Weak<T>, rhs: Weak<T>) -> Bool {
//        lhs.object == rhs.object
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(object?.id)
//    }

}
