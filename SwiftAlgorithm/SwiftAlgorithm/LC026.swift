//
//  LeetCode026.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/10/26.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 026 https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
    public static func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var j = 0
        for element in nums {
            if j == nums.count - 1 {
                break
            }
            if element != nums[j + 1] {
                j = j + 1
            }
            else {
                nums.remove(at: j + 1)
            }
        }
        return j + 1
    }
}
