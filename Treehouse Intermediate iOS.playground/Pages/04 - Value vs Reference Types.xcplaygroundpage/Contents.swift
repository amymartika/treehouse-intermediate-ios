
/*
 ---------------
 Value Semantics
 ---------------
*/

struct Point {
    var x: Double
    var y: Double
    
    mutating func moveLeft(steps: Double) {
        x -= steps // Error without "mutating" keyword
    }
}

var p1 = Point(x: 1, y: 2)
var p2 = p1

p1.x = 4
p2.x // Isn't updated because value is copied on assignment

let p3 = Point(x: 2, y: 4)
// Cannot change the constant container even though property is a variable

struct AnotherPoint {
    let x: Double
    let y: Double
}

var p4 = AnotherPoint(x: 1, y: 2)
p4 = AnotherPoint(x: 12, y: 1)
// Underlying properties are constants, so they cannot be changed

/*
 -------------------
 Reference Semantics
 -------------------
 
 - You can change the underlying values properties on
 a constant here because we're working with that same object.
 - The reference to the object doesn't change but the stored
 properties can be changed pretty easily.
 - You have to be careful here. When we first started learning
 Swift, we learned that variables can change and constants don't.
 As you see now, it is as cut and dry. It depends on whether the
 object is a value or a reference type.
*/

class Robot {
    var model: String
    
    init(model: String) {
        self.model = model
    }
}

var someRobot = Robot(model: "T1999")
var anotherRobot = someRobot

someRobot.model = "T2000"
anotherRobot.model

let thirdRobot = Robot(model: "T3000")
thirdRobot.model = "T4000"

/*
 -------------------------
 Type Methods: Value Types
 -------------------------
 
 * STATIC *
 - Use the static keyword with value types.
 - Static: The method is associated at the type
 level rather than an instance.
 - Static: method is statically dispatched. The
 compiler knows which method you intend to call at
 compile time.
 - In general, always use static to create type
 methods.
*/

import Foundation

struct Map {
    static let origin = Point(x: 0, y: 0)
    
    static func distance(to point: Point) -> Double {
        let horizontalDistance = origin.x - point.x
        let verticalDistance = origin.y - point.y
        
        func square(_ value: Double) -> Double {
            return value * value
        }
        
        let horizontalDistanceSquared = square(horizontalDistance)
        let verticalDistanceSquared = square(verticalDistanceSquared)
        
        return sqrt(horizontalDistanceSquared + verticalDistanceSquared)
    }
}

/*
 -----------------------------
 Type Methods: Reference Types
 -----------------------------
*/

class Calculator {
    class func squareRoot(_ value: Double) -> Double {
        return sqrt(value)
    }
    
    final class func square(_ value: Double) -> Double { // Cannot override method
        return value * value
    }
}

// Final keyword could be used an instance methods and overall classes

Calculator.squareRoot(64)

class NewtonCalculator: Calculator {
    override class func squareRoot(_ value: Double) -> Double {
        var guess = 1.0
        var newGuess: Double
        
        while true {
            newGuess = (value/guess + guesss)/2
            if guess == newGuess {
                return guess
            }
            
            guess = newGuess
        }
    }
}

NewtonCalculator.squareRoot(64)
