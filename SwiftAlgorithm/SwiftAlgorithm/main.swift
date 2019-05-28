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

print("bubble sort result = " + Sort.bubble(array).description)

print("quick sort result = " + Sort.quick(array, 0, array.count - 1).description)

Others.printPyramid(9)

print("twoSum result = " + LeetCode.twoSum(array, 8).description)

print(LeetCode.thirdMax(array))

print(LeetCode.addTwoNumbers(ListNode.getList([5, 4, 3]),
                             ListNode.getList([8, 2, 9]))!.intArray)

print(LeetCode.lengthOfLongestSubstring("assedfeeedfsdjfklm"))

print(LeetCode.reverse(8223372036854775889))

var arr = [1, 1, 2]
print(LeetCode.removeDuplicates(&arr))

let list = ListNode.getList([5, 4, 3, 2, 1])
print(LeetCode.reverseList2(list)!.intArray)

let list2 = ListNode.getList([5, 4, 3, 2, 3, 1])
print(LeetCode.removeElements(list2, 3)!.intArray)

let sortedList = ListNode.getList([1, 1, 1, 2, 2, 3, 4, 5, 6, 6])
print(LeetCode.deleteDuplicates(sortedList)!.intArray)

print(LeetCode.middleNode(ListNode.getList([1, 2, 3, 8, 4, 5]))!.intArray)
