//
//  LeetCode001.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 1: https://leetcode.com/problems/two-sum/description/
    public static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 {
            return []
        }
        var result = [Int]()
        
        for i in 0..<nums.count {
            
            for j in (i + 1)..<nums.count {
                if nums[i] + nums[j] == target {
                    result = [i, j]
                }
            }
        }
        return result
    }
}
