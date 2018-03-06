//
//  ListNode.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/16.
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
}

public extension ListNode {
    
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
    
    var intArray: [Int] {
        var n: ListNode? = self
        var array = [Int]()
        
        while n != nil {
            array.append(n!.value)
            n = n!.next
        }
        return array
    }
}
