import Foundation

public class Manager<Processable: MoneyContainable>: Worker<Processable>, WorkNotificable {
    
    public func didFinishWork(worker: MoneyContainable) {
        if let worker = worker as? Processable {
            self.work(processable: worker)
            worker.money = 0
        }
    }
}
