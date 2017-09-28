
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
 
 - We should always check how functions read at the 
 use site.
 - Omit needless information. Use an underscore to
 omit external names when they aren't necessary.
 - Include all words needed to avoid ambiguity. 
 This can be difficult to balance with the rule 
 above. It comes down to a case-by-case evaluation.
 - Compensate for weak type information. We
 precede each weakly-typed paramater with a noun
 describing its role.
*/

/*
 ------------
 Fluent Usage
 ------------
 
 - Methods and functions should read as grammatical
 English phrases at the use site.
*/

// Example #1

func insert(_ element: String, at index: Int) {}
insert("a", at: 2) // "Insert element at index"

// Example #2

func find(character: String, in range: Range<String.Index>) {}
let character = "a"
let range = character.startIndex..<character.endIndex

find(character: character, in: range) // "Find character in range"

/*
 -------------------------------------
 Prepositional vs. Grammatical Phrases
 -------------------------------------
*/

func move(toPosition position: Int) {}
// Include "Position" in external name because "Int" isn't descriptive enough

func moveTo(x: Int, y: Int) {}
// We're "moving to" both x and y, so we include "to" in the base name

func removeBoxes(havingLength: Int) {}

func dismiss(animated: Bool) {}
dismiss(animated: false)
// There isn't really a better way to word this function

import UIKit
func activate(_ constraints: [NSLayoutConstraint]) {}
// We're aren't using an external name becuase we want to omit needless words
