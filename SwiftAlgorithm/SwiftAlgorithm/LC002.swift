//
//  LeetCode002.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 2: https://leetcode.com/problems/add-two-numbers/description/
    public static func addTwoNumbers(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        var temp1: ListNode? = node1
        var temp2: ListNode? = node2
        let headNode: ListNode? = ListNode(0)
        var current: ListNode = headNode!
        var sum: Int = 0
        
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

            if let n = current.next {
                current = n
            }
        }
        if sum / 10 == 1 {
            current.next = ListNode(1)
        }
        return headNode?.next
    }
}
