import Foundation

public class Manager<Processable: MoneyContainable>: Worker<Processable>, WorkNotificable {
    
    public var available = true
    public let lock = NSCondition()
    
    let subordinatesQueue = OperationQueue()
    
    public func didFinishWork(worker: MoneyContainable) {
        self.subordinatesQueue.addOperation { [weak self] in
            guard let self = self else { return }
            
            if let worker = worker as? Processable {
                
                self.lock.lock()
                self.available = false
                
                self.work(processable: worker)
                
                self.available = true
                self.lock.signal()
                self.lock.unlock()
                
                worker.money = 0
            }
        }
    }
}
