//
//  LeetCode203.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/5/27.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation
extension LeetCode {

    // LeetCode 203 https://leetcode.com/problems/remove-linked-list-elements/
    
    static func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        let fakeHead = ListNode(0)
        fakeHead.next = head
        var cur: ListNode? = fakeHead
        while cur != nil {
            if cur!.next?.value == val {
                cur?.next = cur?.next?.next
            }
            else {
                cur = cur?.next
            }
        }
        return fakeHead.next
    }
}
