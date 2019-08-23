//
//  LC224.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/7/20.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

extension String {
    var int: Int? {
        return Int(self)
    }
    
    var compute: (Int, Int) -> Int {
        func plus(lhs: Int, rhs: Int) -> Int {
            return lhs + rhs
        }
        
        func difference(lhs: Int, rhs: Int) -> Int {
            return lhs - rhs
        }
        if self == "+" {
            return plus
        }
        else {
            return difference
        }
    }
}

extension Character {
    
    var string: String {
        return String(self)
    }
}

extension LeetCode {
    // "(1+(4+5+2)-3)+(6+8)"
    
    static func calculate(_ s: String) -> Int {
        var stack = Stack<String>()
        var result: Int = 0
        
        for c in s.reversed() {
            if c == "(" {
                var temp = 0
                var lhs = stack.pop()!.int!
                while stack.top()! != ")" {
                    let cal = stack.pop()!.compute
                    let rhs = stack.pop()!.int!
                    temp = cal(lhs, rhs)
                    lhs = temp
                }
                stack.pop()
                stack.push(String(temp))
            }
            else {
                stack.push(c.string)
            }
        }
        
        var lhs = stack.pop()!.int!
        while stack.count > 0 {
            let cal = stack.pop()!.compute
            let rhs = stack.pop()!.int!
            result = cal(lhs, rhs)
            lhs = result
        }
        return result
    }
}
