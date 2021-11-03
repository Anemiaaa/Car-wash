import Foundation

public class Chief: Manager<Accountant> {

    // MARK: -
    // MARK: Overriden
    
    public override func process(processable: Accountant) -> ProcessResult {
        let recievedProfit: ProcessResult = processable.money > 0 ? .success : .fail
        
        if processable.money > 0 {
            self.money += processable.money
        }
        
        processable.money = 0
        
        return recievedProfit
    }
}

