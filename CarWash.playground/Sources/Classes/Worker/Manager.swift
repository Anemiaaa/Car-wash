import Foundation

public class Manager<Processable: MoneyContainable>: Worker<Processable>, WorkNotificable {
    
    public var available = true
    public let lock = NSLock()
    
    let subordinatesQueue = DispatchQueue(label: "io.takeMoney", attributes: .concurrent)
    
    public func didFinishWork(worker: MoneyContainable) {
        subordinatesQueue.async { [weak self] in
            guard let self = self else { return }
            
            //print("enter didFinish, worker: \(worker)")
            
            if let worker = worker as? Processable {
                
                self.subordinatesQueue.sync { [weak self] in
                    //print("didFinishWork work")
                    self?.work(processable: worker)
                }
                
                worker.money = 0
            }
        }
    }
}
