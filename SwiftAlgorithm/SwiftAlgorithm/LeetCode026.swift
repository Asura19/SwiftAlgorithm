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
        
        var j = 1
        for (i, element) in nums.enumerated() {
            if i == nums.count - 1 { break }
            if element != nums[i + 1] {
                j = j + 1
            }
        }
        return j
    }
}
