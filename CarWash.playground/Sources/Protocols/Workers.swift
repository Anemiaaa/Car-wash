import Foundation

public class Worker {
    
    // MARK: -
    // MARK: Variables
    
    var id: String
    var workPlace: CarWash?
  
    // MARK: -
    // MARK: Initialization
    
    init() {
        self.id = UUID().uuidString
    }
    
    // MARK: -
    // MARK: Public
    
    func work() {
        
    }
    
    class func process() {
        fatalError("override func process")
    }
}
