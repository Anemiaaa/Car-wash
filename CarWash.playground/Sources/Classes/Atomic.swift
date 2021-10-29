import Foundation

public class Atomic<Value> {

    // MARK: -
    // MARK: Variables

    public var value: Value {
        set {
            self.queue.sync { self._value = newValue }
        }
        
        get {
            return self.queue.sync { self._value }
        }
    }
    
    private var _value: Value
    
    private let queue = DispatchQueue(label: "Atomic serial queue")

    // MARK: -
    // MARK: Initialization

    public init(_ value: Value) {
        self._value = value
    }

    // MARK: -
    // MARK: Public

    public func mutate(_ transform: (inout Value) -> ()) {
        self.queue.sync {
            transform(&self._value)
        }
    }
}
