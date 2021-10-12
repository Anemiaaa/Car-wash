import Foundation

extension Car {
    
    public static func random() -> Car {
        let sizes = [CarSize.small, CarSize.standard, CarSize.large]
        
        return Car(
                        brand: "Random Brand \(Int.random(in: 0 ..< 1000))",
                        money: Float.random(in: 300...1000),
                        size: sizes[Int.random(in: 0 ..< sizes.count)]
        )
    }
}

extension Accountant {
    
    public static func random() -> Accountant {
        Accountant()
    }
}

extension Washer {
    
    public static func random() -> Washer {
        Washer()
    }
}

