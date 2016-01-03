//: Playground - noun: a place where people can play

import UIKit

enum E: ErrorType {
    case Fuck
    case Shit
    case 🙄
}

func fuckThis() throws {
    throw E.Fuck
}

func shitThat() throws {
    throw E.Shit
}

func 🐞() throws {
    throw E.🙄
}

do {
    try fuckThis()
} catch E.Shit {
    print("Oh shit!")
} catch E.Fuck {
    print("WTF")
} catch {
    print("😒")
}

do {
    try shitThat()
} catch E.Shit {
    print("Oh shit!")
} catch E.Fuck {
    print("WTF")
} catch {
    print("😒")
}

do {
    try 🐞()
} catch E.Shit {
    print("Oh shit!")
} catch E.Fuck {
    print("WTF")
} catch {
    print("😒")
}
