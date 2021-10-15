import Foundation

extension Car {
    
    public static func random(count: Int) -> [Car] {
        let sizes = [CarSize.small, CarSize.standard, CarSize.large]
        var cars: [Car] = []
        
        (0..<count).forEach { _ in
            cars.append(Car(
                           brand: "Random Brand \(Int.random(in: 0 ..< 1000))",
                           money: Float.random(in: 450...1000),
                           size: sizes[Int.random(in: 0 ..< sizes.count)]
                        )
            )
        }
        
        return cars
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

