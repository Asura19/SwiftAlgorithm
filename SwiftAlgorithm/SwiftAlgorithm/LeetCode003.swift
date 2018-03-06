//
//  LeetCode003.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 3 https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
    public static func lengthOfLongestSubstring(_ s: String) -> Int {
        var charArray = [Character]()
        for c in s {
            charArray.append(c)
        }
//        let charArray = Array(s.characters)
        let length = charArray.count
        if length <= 1 {
            return length
        }
        var hashMap = Dictionary<Character, Int>()
        var maxLength = 1
        var tempMax = 1
        hashMap[charArray[0]] = 0
        for i in 1...length - 1 {
            if let lastPosition = hashMap[charArray[i]] {
                if tempMax + lastPosition < i {
                    tempMax += 1
                }
                else {
                    tempMax = i - lastPosition
                }
            }
            else {
                tempMax += 1
            }
            hashMap[charArray[i]] = i
            if tempMax > maxLength {
                maxLength = tempMax
            }
        }
        return maxLength
    }
}
