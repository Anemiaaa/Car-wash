import Foundation

protocol WorkNotificable {
    
    func didFinishWork(worker: MoneyContainable)
}

public class Worker<Processable: MoneyContainable>: MoneyContainable {
    
    // MARK: -
    // MARK: Variables

    public let id: String
    public var workPlace: CarWash?
    var delegate: WorkNotificable?
  
    // MARK: -
    // MARK: Initialization
    
    public init() {
        self.id = UUID().uuidString
        super.init(money: 0)
    }
    
    // MARK: -
    // MARK: Public
    
    public func work(processable: Processable) {
        self.process(processable: processable)
        
        self.delegate?.didFinishWork(worker: self)
    }
    
    func process(processable: Processable) {
        fatalError("override func process")
    }
    
}

extension Worker: Hashable {
    
    public static func == (lhs: Worker<Processable>, rhs: Worker<Processable>) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
