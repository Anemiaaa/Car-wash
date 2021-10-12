import Foundation

public protocol BillCalculate {
    
    static func calculate(size: CarSize, literPrice: Float) -> Float
}

extension BillCalculate {
    
    public static func calculate(size: CarSize, literPrice: Float) -> Float {
        let bill: Float
        
        if size == .small {
            bill = literPrice * Float.random(in: 35..<50) + 100
        } else if size == .standard {
            bill = literPrice * Float.random(in: 50..<70) + 150
        } else {
            bill = literPrice * Float.random(in: 70..<90) + 250
        }
        return bill
    }
}
