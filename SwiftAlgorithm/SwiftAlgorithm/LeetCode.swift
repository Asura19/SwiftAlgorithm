//
//  LeetCode.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/14.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Cocoa

public class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ value: Int) {
        self.value = value
        self.next = nil
    }
    
    static func getList(_ nums: [Int]) -> ListNode? {
        var list : ListNode?
        var preNode : ListNode?
        
        for num in nums {
            if preNode == nil {
                list = ListNode(num)
                preNode = list
            }
            else {
                preNode!.next = ListNode(num)
                preNode = preNode!.next
            }
        }
        
        return list
    }
    
    static func print(_ node: ListNode?) -> [Int] {
        var n = node
        var array:[Int] = []
        
        while n != nil {
            array.append(n!.value)
            n = n!.next
        }
        return array
    }

}

open class LeetCode: NSObject {
    
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
    
    
    
    // LeetCode 2: https://leetcode.com/problems/add-two-numbers/description/
    func addTwoNumbers(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        var temp1: ListNode? = node1
        var temp2: ListNode? = node2
        let headNode: ListNode? = ListNode(0)
        var current: ListNode = headNode!
        var sum: Int = 0
        var needCarry: Bool = false
        
        while temp1 != nil || temp2 != nil {
            sum /= 10
            if let n = temp1 {
                sum += n.value
                temp1 = n.next
            }
            if let n = temp2 {
                sum += n.value
                temp2 = n.next
            }
            current.next = ListNode(sum % 10)
            if needCarry {
                current.next?.value += 1
                needCarry = false
            }
            if let n = current.next {
                current = n
                if sum - 10 >= 0 {
                    needCarry = true
                }
            }
        }
        if sum / 10 == 1 {
            current.next = ListNode(1)
        }
        return headNode?.next
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
