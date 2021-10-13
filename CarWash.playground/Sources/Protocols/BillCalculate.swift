import Foundation

public protocol BillCalculate {
    
    func calculate(size: CarSize, literPrice: Float) -> Float
}

