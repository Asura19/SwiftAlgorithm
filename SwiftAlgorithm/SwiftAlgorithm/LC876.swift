//
//  LC876.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/5/28.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

extension LeetCode {

    static func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var slow: ListNode? = head
        var fast: ListNode? = head.next
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
