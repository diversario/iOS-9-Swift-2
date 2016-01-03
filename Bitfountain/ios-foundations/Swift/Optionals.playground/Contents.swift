//: Playground - noun: a place where people can play

import UIKit

var isthisnil: Bool?

print(isthisnil)

var foo: String?

isthisnil = true
foo = "Woot"

print(isthisnil)
print(foo)

var errorCode:String? = "Errr"

if errorCode != nil {
    print("errrr")
}

errorCode = nil

if errorCode != nil {
    print("errrr")
}

errorCode = "WWW"

if errorCode == "WWW" {
    print("wwwwwww")
}

if errorCode == "YYY" {
    print("wwwwwww")
}

if let e = errorCode {
    print(e)
}
