
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

struct User {
    let name: String
    let ID: Int
}

extension User: PrettyPrintable {
    var formattedUser: String {
        return "\("Mr.") + prettyDescription"
    }
}


// End of challenge
