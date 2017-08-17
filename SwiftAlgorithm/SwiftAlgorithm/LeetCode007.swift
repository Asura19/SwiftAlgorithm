//
//  LeetCode007.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 007: https://leetcode.com/problems/reverse-integer/description/
    open static func reverse(_ x: Int) -> Int {
        
        var isNegative = false
        var num: UInt = 0;
        var ux: UInt = x > 0 ? UInt(x) : UInt(-x)
        if x < 0 {
            isNegative = true
        }
        
        while (ux != 0) {
        
            num = num * 10 + ux % 10;
            ux = ux / 10;
        }
        if num > Int.max {
            num = 0
        }
        if isNegative {
            return -Int(num)
        }
        else {
            return Int(num)
        }
        
    }
}


