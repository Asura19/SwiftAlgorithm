//
//  LeetCode414.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 414 https://leetcode.com/problems/third-maximum-number/description/
    public static func thirdMax(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        var first = Int.min
        var second = Int.min
        var third = Int.min
        
        for n in nums {
            
            if n > first {
                third = second
                second = first
                first = n
            }
            else if (n == first) {
                continue
            }
            else if (n > second) {
                third = second
                second = n
            }
            else if (n == second) {
                continue
            }
            else if (n > third) {
                third = n
            }
        }
        return third == Int.min ? first : third
    }
}
