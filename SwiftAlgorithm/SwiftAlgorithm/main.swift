//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2017/8/14.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import Foundation

var array = [6, 5, 1, 3, 8, 4, 7, 9, 2, 0, 11, 34, 7]

var resultArray: [Int]

//print("bubble sort result = " + Sort.bubble(array).description)
//
//print("quick sort result = " + Sort.quick(array, 0, array.count - 1).description)
//
//Others.printPyramid(9)
//
//print("twoSum result = " + LeetCode.twoSum(array, 8).description)
//
//print(LeetCode.thirdMax(array))
//
//print(LeetCode.addTwoNumbers(ListNode.getList([5, 4, 3]),
//                             ListNode.getList([8, 2, 9]))!.intArray)
//
//print(LeetCode.lengthOfLongestSubstring("assedfeeedfsdjfklm"))
//
//print(LeetCode.reverse(8223372036854775889))
//
//var arr = [1, 1, 2]
//print(LeetCode.removeDuplicates(&arr))
//
//let list = ListNode.getList([5, 4, 3, 2, 1])
//print(LeetCode.reverseList2(list)!.description)
//
//let list2 = ListNode.getList([5, 4, 3, 2, 3, 1])
//print(LeetCode.removeElements(list2, 3)!.description)
//
//let sortedList = ListNode.getList([1, 1, 1, 2, 2, 3, 4, 5, 6, 6])
//print(LeetCode.deleteDuplicates(sortedList)!.description)
//
//print(LeetCode.middleNode(ListNode.getList([1, 2, 3, 8, 4, 5]))!.description)
//
//print(LeetCode.isValidParentheses("{{{}}}"))
//print(LeetCode.isValidParentheses("{[{}]}"))
//print(LeetCode.isValidParentheses("}}"))
//print(LeetCode.isValidParentheses("()()[)"))

//print(LeetCode.calculate("1+1"))

//var stack = Stack<String>()
//stack.push("一楼")
//stack.push("二楼")
//stack.push("三楼")
//stack.pop()
//print(stack.top()!)
//print(stack)

//var list = LinkedList<Int>()
//list.append(0)
//list.append(2)
//list.append(4)
//print(list.firstIndex(of: 2))
//print(list.count)

//var list = LinkedList(array: [1, 2])
//list = LinkedList(arrayLiteral: 1, 2, 3, 4, 5, 6, 7)
//list.removeAll { $0 % 2 == 0 }
//for i in list {
//    print(i)
//}
//print(list)
//
//var queue = Queue<Int>()
//queue.enQueue(2)
//queue.enQueue(3)
//queue.enQueue(3)
//
//queue.deQueue()
//print(queue)

//let arr = ArrayList<Int>()
//for i in 0..<120 {
//    arr.append(i)
//    print(arr)
//}
//
//for _ in 0..<115 {
//    arr.removeLast()
//    print(arr)
//}
//
//print(arr)


let one = BinaryTree<Int>.node(.empty, 1, .empty)
let two = BinaryTree<Int>.node(.empty, 2, .empty)
let three = BinaryTree<Int>.node(.empty, 3, .empty)
let four = BinaryTree<Int>.node(.empty, 4, .empty)

let left = BinaryTree<Int>.node(one, 8, two)
let right = BinaryTree<Int>.node(three, 9, four)
let root = BinaryTree<Int>.node(left, 10, right)


root.traverseLevelOrder { (value) in
    print(value)
}
print("---------")

