//
//  LeetCode.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/14.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Cocoa

class LeetCode: NSObject {
    
    static let shared = LeetCode()
    
    // LeetCode 1: https://leetcode.com/problems/two-sum/description/
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
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
    
    // LeetCode 414 https://leetcode.com/problems/third-maximum-number/description/
    func thirdMax(_ nums: [Int]) -> Int {
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
