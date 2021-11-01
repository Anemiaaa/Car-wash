import Foundation

public class Atomic<Value> {

    // MARK: -
    // MARK: Variables
    
    let lock = NSLock()

    public var value: Value {
        set {
            lock.lock()
            
            self._value = newValue
            
            lock.unlock()
        }
        
        get {
            self._value
        }
    }
    
    private var _value: Value

    // MARK: -
    // MARK: Initialization

    public init(_ value: Value) {
        self._value = value
    }

    // MARK: -
    // MARK: Public

    public func mutate(_ transform: (inout Value) -> ()) {
        lock.lock()
        
        transform(&self._value)
        
        lock.unlock()
    }
}
