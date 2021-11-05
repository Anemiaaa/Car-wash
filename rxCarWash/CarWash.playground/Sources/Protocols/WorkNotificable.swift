import Foundation
import RxSwift

public protocol WorkNotificable {
    
    var available: Bool { get set }
    
    var subordinatesQueue: DispatchQueue { get }
    
    var managerStatesHandler: PublishSubject<States> { get }
}
