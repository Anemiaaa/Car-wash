import Foundation

public enum ProcessResult {
    
    case success
    case fail
}

public class Worker<Processable: MoneyContainable>: WorkerType {

    // MARK: -
    // MARK: Public
    
    public func work(processable: Processable) {
        if self.process(processable: processable) == .success {
            guard let supervisor = self.delegate else { return }
            
            supervisor.didFinishWork(worker: self)
        }
    }
    
    public func process(processable: Processable) -> ProcessResult {
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
