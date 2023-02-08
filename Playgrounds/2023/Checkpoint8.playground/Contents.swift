import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    func salesSummary()
}



struct House: Building {

    let rooms = 3
    var cost = 590000
    var estateAgent = "Sandy"
    
    func salesSummary() {
        print("House with \(rooms) rooms is being sold for \(cost) by \(estateAgent)")
    }
    
}

var Brusna = House()

Brusna.salesSummary()


struct Office: Building {

    let rooms = 10
    var cost = 1000000
    var estateAgent = "Megacorp"
    
    func salesSummary() {
        print("Office with \(rooms) rooms is being sold for \(cost) by \(estateAgent)")
    }
    
}

var officePark = Office()
officePark.salesSummary()
