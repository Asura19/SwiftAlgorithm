//
//  BinaryTree.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/8/31.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

public indirect enum BinaryTree<E> {
    case node(BinaryTree<E>, E, BinaryTree<E>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    public var isLeaf: Bool {
        switch self {
        case let .node(left, _, right):
            if case .empty = left,
               case .empty = right {
                return true
            }
            else {
                return false
            }
        default:
            return false
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}

// MARK: - Recursive traversal
extension BinaryTree {
    public func traverseInOrder(process: (E) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder(process: (E) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (E) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    public func traverseLevelOrder(process: (E) -> Void) {
        var queue = Queue<BinaryTree<E>>()
        queue.enQueue(self)
        while !queue.isEmpty {
            if case let .node(left, value, right) = queue.deQueue() {
                process(value)
                queue.enQueue(left)
                queue.enQueue(right)
            }
        }
    }
}

// MARK: - Iteration traversal
extension BinaryTree {
    public func i_traverseInOrder(process: (E) -> Void) {
        var node = self
        var stack = Stack<BinaryTree<E>>()
        stack.push(node)
        while !stack.isEmpty {
            if case let .node(left, _, _) = node {
                stack.push(node)
                node = left
            }
            else {
                if case let .node(_, value, right) = stack.pop() {
                    process(value)
                    node = right
                }
            }
        }
    }
    
    public func i_traversePreOrder(process: (E) -> Void) {
        let node = self
        var stack = Stack<BinaryTree<E>>()
        stack.push(node)
        while !stack.isEmpty {
            if case let .node(left, value, right) = stack.pop() {
                process(value)
                stack.push(right)
                stack.push(left)
            }
        }
    }
    
    public func i_traversePostOrder(process: (E) -> Void) {
        
    }
}

extension BinaryTree {
    public func invert() -> BinaryTree {
        if case let .node(left, value, right) = self {
            return .node(right.invert(), value, left.invert())
        }
        else {
            return .empty
        }
    }
}
