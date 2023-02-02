import Cocoa

for i in 1...100 {
    
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
        continue
    }
    
    if i.isMultiple(of: 3) {
        print("Fizz")
        continue
    }
    
    if i.isMultiple(of: 5) {
        print("Buzz")
        continue
    }
    
    print(i)
}

