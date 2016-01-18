//
//  main.swift
//  NullCoalescingOp
//
//  Created by dudeinthemirror on 11/5/15.
//  Copyright © 2015 dudeinthemirror. All rights reserved.
//

import Foundation

let x: Int? = nil

let y = x ?? 999

print("y is: \(y)") // expected y is 999



infix operator ??= {
associativity right
precedence 90
}

func ??=<T>(inout assignTo: T?, @autoclosure defaultValue: () -> T?) -> T? {
    print ("\n=============\(assignTo),", "\(defaultValue())======================")
    if assignTo == nil {
        if defaultValue() == nil {
            return nil
        } else {
            assignTo = defaultValue()
            return assignTo
        }
    } else {
        return assignTo
    }
}

var z: Int?

// z==nil , x==nil
z ??= x
print("z is: \(z)") // expected z is nil


// z==nil, y==999
z ??= y
print("z is: \(z)") // expected z is Optional(999)

z = 111

// z===111, y==999
z ??= y
print("z is: \(z)") // expected z is Optional(111)

