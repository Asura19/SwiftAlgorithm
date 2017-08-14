//
//  Others.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/14.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Cocoa

open class Others: NSObject {
    
    static let shared = Others()
    
    func printPyramid(_ m: Int) {
        var n = m
        if n > 9 {
            n = 10
        }
        for i in 0..<n {
            
            for _ in 0..<n-i {
                print(" ", terminator: "")
            }
            
            for _ in 0..<(2 * i + 1) {
                print(i, terminator: "")
            }
            print()
        }
    }
}
