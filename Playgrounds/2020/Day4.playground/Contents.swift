import UIKit

let albums = ["Minutes to Midnight", "Hyrbid Theory", "One More Light"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")
for _ in 1...5 {
    print("play")
}

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

repeat {
    print("This is false")
} while false

var countDown = 5
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

var people = 2
while people < 10 {
    people += 2
    if people == 10 {
        print("We got 10 people.")
    }
}

var counter: Int = 1
while counter < 100 {
    counter += 10
    if counter % 10 == 5 {
        print("Matching number found")
    }
}

outerLoop: for i in 1...10 {
    innerloop: for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

var carsProduced = 0
repeat {
    carsProduced += 1
    if carsProduced % 2 == 0 {
        continue
    }
    print("Another car was built.")
} while carsProduced < 20



for name in ["Taylor"] {
    print("Welcome, \(name)!")
}
