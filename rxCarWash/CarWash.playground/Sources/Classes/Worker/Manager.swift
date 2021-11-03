import Foundation

public class Manager<Processable: MoneyContainable>: Worker<Processable>, WorkNotificable {
    
    public var available = true
    
    public let subordinatesQueue = DispatchQueue(label: "io.takeMoney", attributes: .concurrent)
}
