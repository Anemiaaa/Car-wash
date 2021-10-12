import Foundation

public class Chief {
    
    // MARK: -
    // MARK: Variables
    
    weak var workPlace: CarWash?
    
    private var profit: Float = 0
    
    // MARK: -
    // MARK: Initialization
    
    public init() {}
    
    // MARK: -
    // MARK: Public
    
    public func earn(money: Float) {
        self.profit += money
    }
}
