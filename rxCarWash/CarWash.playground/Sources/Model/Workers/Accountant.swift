import Foundation

public class Accountant: Manager<Washer> {
        
    // MARK: -
    // MARK: Overriden
    
    public override func process(processable: Washer) -> ProcessResult {
        let recievedProfit: ProcessResult = processable.money > 0 ? .success : .fail
        
        if processable.money > 0 {
            let changedMoney = processable.money / 100 * 75
            self.money = changedMoney
        }
        
        processable.money = 0
        
        return recievedProfit
    }
}
