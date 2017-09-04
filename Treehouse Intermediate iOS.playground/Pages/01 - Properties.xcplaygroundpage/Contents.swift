
/*
 ---------------
 Type Properties
 ---------------
*/

struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Map {
    static let origin = Point()
}

Map.origin

/*
 -------------------
 Computed Properties
 -------------------
 
 - Must always be var.
 - Must always provide a type.
 - Behave like stored properties.
 - If we don't specify a constant to bind the value in a computer
 property's setter, it is automatically bound to a new variable
 named newValue.
 - Cannot store properties.
*/

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            
            return Point(x: centerX, y: centerY)
        }
        
        set (centerValue) {
            origin.x = centerValue.x - size.width/2
            origin.y = centerValue.y - size.height/2
        }
    }
}

var rect = Rectangle()
print(rect.center)
rect.size = Size(width: 20, height: 15)
print(rect.center)
rect.center = Point(x: 10, y: 15)
print(rect.center)
print(rect.origin) // Changes to reflect new center

/*
 ---------------------
 Reading Modes Example
 ---------------------
*/

import UIKit

enum ReadingMode {
    case day
    case evening
    case night
    
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .day, .evening: return .default
        case .night: return .lightContent
        }
    }
    
    var headlineColor: UIColor {
        switch self {
        case .night: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .day, .evening: return UIColor(red: 16/255.0, green: 16/255.0, blue: 16/255.0, alpha: 1.0)
        }
    }
    
    var dateColor: UIColor {
        switch self {
        case .day, .evening: return UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
        case .night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        }
    }
    
    var bodyTextColor: UIColor {
        switch self {
        case .day, .evening: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        }
    }
    
    var linkColor: UIColor {
        switch self {
        case .day, .evening: return UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
        case .night: return UIColor(red: 161/255.0, green: 161/255.0, blue: 161/255.0, alpha: 1.0)
        }
    }
}

let titleLabel = UILabel()

func setupDisplay(with mode: ReadingMode) {
    titleLabel.textColor = mode.headlineColor
}

setupDisplay(with: .night)
setupDisplay(with: .day)

/*
 ----------------------
 Lazy Stored Properties
 ----------------------
 
 - Initial value is not calculated until the first time
 that we call it on an instance.
 - Essentially a stored property that we're deferring
 the creation of.
 - Ensures that you don't waste computational power needlessly.
 - Must also be var.
 - If you're not going to use the stored property immediately
 when you create the object, but you do need it as a stored
 property so you can reference it throughout the class, it might
 make sense to lazy load it to save resources.
*/

import Foundation

class ReadItLaterNetworkingClient {
    
    lazy var session: URLSession = URLSession(configuration: .default)
    
}

/*
 --------------
 Code Challenge
 --------------
*/

struct LevelTracker {
    static let maxLevel: Int = 2
}

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

let UIFontTextStyleHeadline = "UIFontTextStyleHeadline"
let UIFontTextStyleBody = "UIFontTextStyleBody"
let UIFontTextStyleFootnote = "UIFontTextStyleFootnote"

enum Text {
    case headline
    case body
    case footnote
    
    var style: String {
        switch self {
        case Text.headline:
            return UIFontTextStyleHeadline
        case Text.body:
            return UIFontTextStyleBody
        case Text.footnote:
            return UIFontTextStyleFootnote
        }
    }
}

// End of challenge
