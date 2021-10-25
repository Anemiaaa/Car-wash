import Foundation

public class WorkerType: MoneyContainable, Equatable {
    
    // MARK: -
    // MARK: Variables

    public var money: Float
    public var workPlace: CarWash?
    public var delegate: WorkNotificable?
    
    public let id: UUID
    
    // MARK: -
    // MARK: Initialization
    
    public init() {
        self.id = UUID()
        self.money = 0
    }
    
    // MARK: -
    // MARK: Equatable
    
    public static func == (lhs: WorkerType, rhs: WorkerType) -> Bool {
        lhs.id == rhs.id
    }
}
