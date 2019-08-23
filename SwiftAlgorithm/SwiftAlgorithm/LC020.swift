//
//  LC020.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/7/20.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    // https://leetcode.com/problems/valid-parentheses/
    static func isValidParentheses(_ s: String) -> Bool {
        let parentheses: [Character: Character] = [
            "(": ")",
            "[": "]",
            "{": "}"
        ]
        var stack = Stack<Character>()
        for c in s {
            if parentheses.keys.contains(c) {
                stack.push(c)
            }
            else {
                if stack.isEmpty { return false }
                let left = stack.pop()!
                let right = parentheses[left]!
                if c != right {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
