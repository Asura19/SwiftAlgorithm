//
//  LeetCode206.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/5/27.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {
    
    // LeetCode 206 https://leetcode.com/problems/reverse-linked-list/
    
    static func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        if head.next == nil { return head }
        let newHead = reverseList(head.next)
        head.next?.next = head
        head.next = nil
        return newHead
    }
    
    static func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        if head!.next == nil { return head }
        var head = head
        var newHead: ListNode? = nil
        while head != nil {
            let temp: ListNode? = head!.next
            head!.next = newHead
            newHead = head
            head = temp
        }
        return newHead
    }
    
}
