//
//  ListNode.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Cocoa

open class ListNode: NSObject {
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
