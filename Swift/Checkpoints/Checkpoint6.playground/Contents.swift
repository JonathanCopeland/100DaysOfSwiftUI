import Cocoa

struct car {
    private var gear = 1
    private let model: String
    private let seats: Int

    public mutating func changeGearUp() {
        if gear == 5 {
            print("No")
        }
        else {
            gear += 1
        }
        
        status()
    }
    
    public mutating func changeGearDown() {
        if gear == 1 {
            print("No")
        }
        else {
            gear -= 1
        }
        
        status()
    }
    
    private func status() {
        print("Gear changed to \(gear)")
    }
    
    init(name: String, seats: Int) {
        self.model = name
        self.seats = seats
        print("Your car is a \(model) with \(seats) seats")
    }
    
}


var myCar = car(name: "Fiat 500e", seats: 4)
myCar.changeGearUp()
myCar.changeGearDown()
