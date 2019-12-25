//
//  Sort.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/14.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Cocoa

public class Sort {
       
}


public extension Array where Element: Comparable {
    func bubbleSorted() -> [Element] {
        var a = self
        for i in 0..<(a.count - 1) {
            for j in 0..<(a.count - 1 - i) {
                if a[j] > a[j + 1] {
                    a.swapAt(j, j + 1)
                }
            }
        }
        return a
    }
    
    func quickSorted() -> [Element] {
        
        func quick(_ array: [Element], left: Int, right: Int) -> [Element] {
            var a = array
            if a.isEmpty || a.count == 1 || left >= right {
                return a
            }
            
            var i = left
            var j = right
            let pivot = a[i]
            
            while i < j {
                
                while a[j] >= pivot && i < j {
                    j -= 1
                }
                a[i] = a[j]
                
                while a[i] <= pivot && i < j {
                    i += 1
                }
                a[j] = a[i]
            }
            a[i] = pivot
            
            a = quick(a, left: left, right: i - 1)
            a = quick(a, left: i + 1, right: right)
            return a
        }
        
        return quick(self, left: 0, right: self.count - 1)
    }
}
