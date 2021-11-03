import Foundation

public protocol WorkNotificable {
    
    var available: Bool { get set }
    
    var subordinatesQueue: DispatchQueue { get }
}
