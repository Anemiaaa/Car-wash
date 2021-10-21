import Foundation

public class Accountant: Manager<Washer> {
        
    // MARK: -
    // MARK: Overriden
    
    public override func process(processable: Washer) {
        if processable.money > 0 {
            let changedMoney = processable.money / 100 * 75
            self.money = changedMoney
        }
    }
}
