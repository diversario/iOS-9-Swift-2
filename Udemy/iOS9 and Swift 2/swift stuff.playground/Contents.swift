//: Playground - noun: a place where people can play

import UIKit

var names = ["a", "b", "c"]

var names2: [String]

var names3 = [String]()

var colors = [String](count: 3, repeatedValue: "poop")

colors[0] = "not poop"

var cars = [String]()

cars.append("Challenger")
cars.append("Prius")
cars.append("Ford Camry")

cars.removeAtIndex(1)

cars.append("Hovercar")

cars.insert("Boeing 123", atIndex: 0)

/********************/

var sb: [String: String] = [
    "spongebob": "is dope",
    "patrick": "is dumb"
]

var nums = [1: "two", 3: "four"]

print(sb["spongebob"])

if let s = sb["spongebob"] {
    print(s)
}

print(sb["spongebob"] ?? 5)
print(sb["plankton"] ?? 5)

sb = [:] // lol

var highScore: [String: Int] = ["derp": 32, "meh": 1, "well, shit": -2]

print(highScore["derp"] ?? "")

for (user, score) in highScore {
    print(user, score)
}

highScore["🍑"] = 9001

for (user, score) in highScore {
    print(user, score)
}

/*===================================================================================*/

class Vehicle {
    private var engine = "4 cyl"
    private var color = "Silver"
    private var _odometer = 0
    
    init(engine: String, color: String) {
        self.engine = engine
        self.color = color
    }
    
    init(){}
    
    var odometer: Int {
        get {
            return _odometer
        }
        set {
            if newValue >= _odometer {
                _odometer = newValue
            }
        }
    }
    
    func enterMiles(m: Int) {
        odometer += m
    }
}


var srx = Vehicle(engine: "6 cyl", color: "Poop")

var volvo = Vehicle()

print(srx.color, volvo.color)

volvo.odometer = 100
volvo.odometer
volvo.odometer = 50
volvo.odometer

/**********************************in the heritance ********************************/

class Person {
    var eyeColor = "blue"
    var name: String
    var speed = "10 MPH"
    var benchPress = "200 LBS"
    
    init (name: String) {
        self.name = name
    }
    
    func catchPhrase() -> String {
        return "Hi, I'm an average person!"
    }
}

var john = Person(name: "John")

class Animorph: Person {
    var animalType = "Dog"
    
    convenience init(type: String, name: String) {
        self.init(name: name)
        self.animalType = type
    }
    
    override func catchPhrase() -> String {
        return "I can turn into a car or something"
    }
}

var dolphin = Animorph(type: "Dolphin", name: "Jack")
dolphin.eyeColor
dolphin.catchPhrase()

class SuperHero: Person {
    var specialPower = "X-Ray Vision"
    var backStory = "I ate an X-Ray machine ¯\\_(ツ)_/¯"
    
    convenience init(name: String, press: String) {
        self.init(name: name)
        self.benchPress = press
    }
    
    override func catchPhrase() -> String {
        return "I will super fuck you up!"
    }
}

var pukeMan = SuperHero(name: "Puke Man", press: "5000 LBS")

pukeMan.catchPhrase()


/*******************************polyshmorphism*******************************/

class Shape {
    var area: Double?
    
    func calculateArea() {}
    
    func printArea() {
        print("It's \(area)")
    }
}

class Rectangle: Shape {
    var width = 1.0
    var height = 1.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override func calculateArea() {
        area = width * height
    }
}

class Circle: Shape {
    var radius = 1.0
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override func calculateArea() {
        area = 3.14 * radius * radius
    }
}

var circle = Circle(radius: 5)
var rect = Rectangle(width: 20, height: 30)

circle.calculateArea()
rect.calculateArea()

circle.area
rect.area


/*********************************optionals***********************************/



/*************************extension************************/

var account1 = 400.2
var account2 = 200.1
var account3 = 100.4

print("$\(account1)")
print("$\(account2)")
print("$\(account3)")


extension Double {
    var currency: String {
        return "$\(self)"
    }
}

var account4 = 400.2
var account5 = 200.1
var account6 = 100.4

print(account4.currency)
print(account5.currency)
print(account6.currency)



let time = 1453582473
var d = NSDate(timeIntervalSince1970: NSTimeInterval(time))

var dc = NSDateComponents()
dc
