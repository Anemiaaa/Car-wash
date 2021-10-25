import Foundation

public class Worker<Processable: MoneyContainable>: WorkerType {

    // MARK: -
    // MARK: Public
    
    public func work(processable: Processable) {
        self.process(processable: processable)
        
        self.delegate?.didFinishWork(worker: self)
    }
    
    public func process(processable: Processable) {
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
