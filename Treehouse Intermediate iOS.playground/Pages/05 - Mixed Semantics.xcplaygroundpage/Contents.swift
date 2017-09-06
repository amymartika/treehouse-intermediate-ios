
struct Point {
    let x: Double
    let y: Double
}

struct Size {
    let width: Double
    let height: Double
}

struct Rect {
    let origin: Point
    let size: Size
}

struct Color {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
    static var blue: Color {
        return Color(red: 0, green: 0, blue: 1)
    }
    
    static var red: Color {
        return Color(red: 1.0, green: 0, blue: 0)
    }
    
    static var white: Color {
        return Color(red: 0, green: 0, blue: 0)
    }
    
    init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
        self.red = red/255.0
        self.green = green/255.0
        self.blue = blue/255.0
        self.alpha = alpha
    }
}

class View {
    var frame: Rect
    var backgroundColor: Color = .white
    
    init(frame: Rect) {
        self.frame = frame
    }
}

struct Shape {
    let view: View
    
    init(x: Double, y: Double, width: Double, height: Double, color: Color) {
        let origin = Point(x: x, y: y)
        let size = Size(width: width, height: height)
        
        let rect = Rect(origin: origin, size: size)
        self.view = View(frame: rect)
        view.backgroundColor = color
    }
}

let square = Shape(x: 0, y: 0, width: 100, height: 100, color: .red) // The container is a constant, not the stored property
square.view.backgroundColor = .blue // Danger of using value types that use reference types within
