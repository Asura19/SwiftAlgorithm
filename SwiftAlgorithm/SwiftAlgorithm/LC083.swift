//
//  LC083.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/5/27.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 083 https://leetcode.com/problems/remove-duplicates-from-sorted-list/
    static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var cur: ListNode? = head
        while cur?.next != nil {
            while cur?.value == cur?.next?.value {
                cur?.next = cur?.next?.next
            }
            cur = cur?.next
        }
        return head
    }

}
