import Cocoa

// 'Private vs 'Public'
// 'Fileprivate' means don;t let anything outside the current file use this

struct BankAccount {
    private var funds = 0

    public mutating func deposit(amount: Int) {
        funds += amount
    }

    public mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// *****

// Static
// Belongs to the parent instance, not each instance

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

// The school struct is created at runtime
// Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.



