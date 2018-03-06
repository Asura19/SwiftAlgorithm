//
//  Quick.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension Sort {
    
    public static func quick(_ array: [Int], _ left: Int, _ right: Int) -> [Int] {
        var a = array
        
        if a.count <= 1 {
            return a
        }
        
        if left >= right {
            return a
        }
        
        var i = left
        var j = right
        let pivot = a[i]
        
        while i < j {
            
            while i < j && a[j] >= pivot {
                j -= 1
            }
            a[i] = a[j]
            
            while i < j && a[i] <= pivot {
                i += 1
            }
            a[j] = a[i]
        }
        
        a[i] = pivot
//                print(a)
        a = quick(a, left, i - 1)
        a = quick(a, i + 1, right)
        return a
    }
}
