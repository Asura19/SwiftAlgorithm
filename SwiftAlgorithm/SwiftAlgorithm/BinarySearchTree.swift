//
//  BinarySearchTree.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/9/2.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

public class BinarySearchTree<E: Comparable> {
    
    fileprivate(set) public var value: E
    fileprivate(set) public var parent: BinarySearchTree?
    fileprivate(set) public var left: BinarySearchTree?
    fileprivate(set) public var right: BinarySearchTree?
    
    public init(value: E) {
        self.value = value
    }
    
    public convenience init(array: [E]) {
      precondition(array.count > 0)
      self.init(value: array.first!)
      for v in array.dropFirst() {
        insert(v)
      }
    }

    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChild: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
}

extension BinarySearchTree {
    
    public func insert(_ value: E) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            }
            else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        }
        else {
            if let right = right {
                right.insert(value)
            }
            else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    @discardableResult
    public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        if let right = right {
            replacement = right.minimum()
        }
        else if let left = left {
            replacement = left.maximum()
        }
        else {
            replacement = nil
        }
        
        replacement?.remove()
        
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        
        if let parent = parent {
            if isLeftChild {
                parent.left = replacement
            }
            else {
                parent.right = replacement
            }
            replacement?.parent = parent
        }
        
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
}

extension BinarySearchTree {
    public func search(_ value: E) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let nd = node {
            if value < nd.value {
                node = nd.left
            }
            else if value > nd.value {
                node = nd.right
            }
            else {
                node = nd
            }
        }
        return nil
    }
    
    public func contains(_ value: E) -> Bool {
        return search(value) != nil
    }
    
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    public func depth() -> Int {
        var node = self
        var depth = 0
        while let parent = node.parent {
            node = parent
            depth += 1
        }
        return depth
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        }
        else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func predecessor() -> BinarySearchTree? {
        if let left = left {
            return left.maximum()
        }
        else {
            var node = self
            while let parent = node.parent {
                if parent.value < value {
                    return parent
                }
                node = parent
            }
        }
        return nil
    }
    
    public func successor() -> BinarySearchTree? {
        if let right = right {
            return right.minimum()
        }
        else {
            var node = self
            while let parent = node.parent {
                if parent.value > value {
                    return parent
                }
                node = parent
            }
        }
        return nil
    }
}

// MARK: - Traversal
extension BinarySearchTree {
    public func traverseInOrder(process: (E) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (E) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (E) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = left {
      s += "(\(left.description)) <- "
    }
    s += "\(value)"
    if let right = right {
      s += " -> (\(right.description))"
    }
    return s
  }

}
