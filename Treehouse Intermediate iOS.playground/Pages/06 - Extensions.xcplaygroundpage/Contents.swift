
/*
 ----------
 Extensions
 ----------
 
 - Can add computed properties.
 - Cannot add stored properties or property observers.
 - Can add new type and instance methods.
 - Can define nested types.
 - Can add convenient initializers.
 - Cannot add designated initializers (for the same reasons
 you can't add stored properties).
*/

extension Int {
    var isOdd: Bool {
        return self % 2 != 0
    }
}

// We just added our own functionality to a native type

3.isOdd
2.isOdd

/*
 ---------------------------------------
 Protocol Conformance through Extensions
 ---------------------------------------
*/

protocol UniquelyIdentifiable {
    var uuid: Int { get }
}

import UIKit

extension UIView: UniquelyIdentifiable {
    var uuid: Int {
        return hash
    }
}

let view = UIView()
view.hash

/*
 -------------------
 Protocol Extensions
 -------------------
*/

protocol RandomNumberGenerator {
    func random() -> Int
}

extension RandomNumberGenerator {
    func random() -> Int {
        return Int(arc4random())
    }
}

class Generator: RandomNumberGenerator {}

let generator = Generator()
generator.random()

protocol Person {
    var firstName: String { get }
    var lastName: String { get }
    var fullName: String { get }
    
    func greeting() -> String
}

extension Person {
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func greeting() -> String {
        return "Hi, my name is \(fullName)"
    }
}

struct User: Person {
    let firstName: String
    let lastName: String
    
    func greeting() -> String {
        return "Hey there! Nice to meet you. My name is \(fullName)."
    }
}

let user = User(firstName: "Pasan", lastName: "Premeratne")
user.fullName
user.greeting()

let anotherUser: Person = User(firstName: "Amy", lastName: "Daniels")
anotherUser.fullName
anotherUser.greeting()

struct Friend: Person {
    let firstName: String
    let middleName: String?
    let lastName: String
    
    var fullName: String {
        guard let middleName = middleName else {
            return "\(firstName) \(lastName)"
        }
        
        return "\(firstName) \(middleName) \(lastName)"
    }
    
    func greeting() -> String {
        return "Hola, \(fullName)!"
    }
}

let someFriend = Friend(firstName: "Bethany", middleName: "Renea", lastName: "Burton")

let people = [user, anotherUser, someFriend]

for person in people {
    print(person.greeting())
}

/*
 --------------
 Code Challenge
 --------------
*/

extension String {
    func add(value: Int) -> Int? {
        guard let convertedNumber = Int(self) else {
            return nil
        }
        
        return convertedNumber + value
    }
}

"Hello".add(value: 4)

// End of challenge

/*
 --------------
 Code Challenge
 --------------
 
 extension Int {
 var isOdd: Bool {
 return self % 2 != 0
 }
 }
*/

protocol PrettyPrintable {
    var prettyDescription: String { get }
}

struct NewUser {
    let name: String
    let ID: Int
}

extension NewUser: PrettyPrintable {
    var prettyDescription: String {
        return ""
    }
}


// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

protocol Calculator {
    func square(_ value: Double) -> Double
}

extension Calculator {
    func square(_ value: Double) -> Double {
        return value * value
    }
}

// End of challenge
