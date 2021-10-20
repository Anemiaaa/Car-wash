import Foundation

public class Accountant: Worker<Washer>, WorkNotificable {
    
    // MARK: -
    // MARK: Public
    
    func didFinishWork(worker: MoneyContainable) {
        worker.money = 0
    }
    
    // MARK: -
    // MARK: Overriden
    
    override func process(processable: Washer) {
        if processable.money > 0 {
            let changedMoney = processable.money / 100 * 75
            self.money = changedMoney
        }
    }
}
