//
//  Bubble.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension Sort {
    
    open static func bubble(_ array: Array<Int>) -> [Int] {
        var a = array
        
        let count = a.count
        
        for i in 0..<(count - 1) {
            for j in 0..<(count - 1 - i) {
                if a[j] > a[j+1] {
                    let temp = a[j]
                    a[j] = a[j+1]
                    a[j+1] = temp
                }
            }
        }
        return a
    }
    
}
