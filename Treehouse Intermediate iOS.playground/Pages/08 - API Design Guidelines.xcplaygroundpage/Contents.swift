
/*
 ---------------------------
 Goals When Writing in Swift
 ---------------------------
 
 1. Clarity at the point of use. When we write methods
 or functions, how they read when we call those methods
 is far more important than when we define them. Readability
 at call site is more important than point of definition 
 because we call functions many times.
 
 2. Clarity over brevity. It is a non-goal to enable
 the smallest possible code. We want to understand the
 code well, even if that means writing more code. When 
 brevity occurs, it's a side effect of some of Swift's features.
*/

/*
 ------------
 Naming Types
 ------------
 
 - All variables, parameters, and types should be
 named according to their role, no matter how 
 insignificant that line of code is.
 - Names of types, properties, variables, and constants
 should read as nouns.
 
 * EXCEPTIONS *
 - Naming boolean values. Boolean properties should
 read as assertions about the receiver. "Is" and
 "contains" are common assertions for boolean values.
 - Protocols that model capabilities. Protocols that
 describe what something is shoudl be nouns. Protocols
 that describe a type's capability should be named using
 "-able," "-ible," or "-ing" suffixes. Swift Standard
 Library examples of this include Equatable, Comparable,
 and ExpressibleByStringLiteral.
*/

// Example #1

var someValue = 12
var counter = 12 // conveys more information

// Example #2

class NetworkResponse {} // good class name
class NetworkManager {} // too ambigious

/*
 --------------
 Naming Methods
 --------------
*/



