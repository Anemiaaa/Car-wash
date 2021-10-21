import Foundation

public class Accountant: Worker<Washer>, WorkNotificable {
        
    // MARK: -
    // MARK: Public
    
    public func didFinishWork(worker: MoneyContainable) {
        if var washer = worker as? Washer {
            self.work(processable: washer)
            worker.money = 0
        }
    }
    
    // MARK: -
    // MARK: Overriden
    
    public override func process(processable: Washer) {
        if processable.money > 0 {
            let changedMoney = processable.money / 100 * 75
            self.money = changedMoney
        }
    }
}
