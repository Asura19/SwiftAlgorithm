//
//  AVLTree.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/9/5.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

public class TreeNode<Key: Comparable, Value> {
    public typealias Node = TreeNode<Key, Value>
    
    var value: Value?
    
    fileprivate var key: Key
    internal var left: Node?
    internal var right: Node?
    fileprivate var height: Int
    weak fileprivate var parent: Node?
    
    public init(key: Key, value: Value?, left: Node?, right: Node?, parent: Node?, height: Int) {
        self.key = key
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
        self.height = height
        
        self.left?.parent = self
        self.right?.parent = self
    }
    
    public convenience init(key: Key, value: Value?) {
      self.init(key: key, value: value, left: nil, right: nil, parent: nil, height: 1)
    }
    
    public convenience init(key: Key) {
      self.init(key: key, value: nil)
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
    
    public var balanceFactor: Int {
        let leftHeight = left == nil ? 0 : left!.height
        let rightHeight = right == nil ? 0 : right!.height
        return leftHeight - rightHeight
    }
    
    public var isBalance: Bool {
        return abs(self.balanceFactor) <= 1
    }
    
    public func updateHeight() {
        let leftHeight = left == nil ? 0 : left!.height
        let rightHeight = right == nil ? 0 : right!.height
        height = 1 + max(leftHeight, rightHeight)
    }
    
    public var tallerChild: Node? {
        let leftHeight = left == nil ? 0 : left!.height
        let rightHeight = right == nil ? 0 : right!.height
        if leftHeight > rightHeight { return left }
        if leftHeight < rightHeight { return right }
        return isLeftChild ? left : right
    }
}

open class AVLTree<Key: Comparable, Value> {
    public typealias Node = TreeNode<Key, Value>
    
    fileprivate(set) var root: Node?
    fileprivate(set) var size = 0
    
    public init() { }
}

extension TreeNode {
    public func minimum() -> TreeNode? {
        return left?.minimum() ?? self
    }
    
    public func maximum() -> TreeNode? {
        return right?.maximum() ?? self
    }
}

extension AVLTree {
    subscript(key: Key) -> Value? {
        get {
            return search(input: key)
        }
        set {
            insert(key: key, value: newValue)
        }
    }
    
    public func search(input: Key) -> Value? {
        return search(key: input, node: root)?.value
    }
    
    public func search(key: Key, node: Node?) -> Node? {
        if let node = node {
            if key == node.key {
                return node
            }
            else if key < node.key {
                return search(key: key, node: node.left)
            }
            else {
                return search(key: key, node: node.right)
            }
        }
        return nil
    }
}

extension AVLTree {
    public func insert(key: Key, value: Value? = nil) {
        if let root = root {
            insert(input: key, value: value, node: root)
        }
        else {
            root = Node(key: key, value: value)
        }
        size += 1
    }
    
    private func insert(input: Key, value: Value?, node: Node) {
        if input < node.key {
            if let child = node.left {
                insert(input: input, value: value, node: child)
            }
            else {
                let child = Node(key: input, value: value, left: nil, right: nil, parent: node, height: 1)
                node.left = child
                balanceAfterAdd(node: child)
            }
        }
        else if input > node.key {
            if let child = node.right {
                insert(input: input, value: value, node: child)
            }
            else {
                let child = Node(key: input, value: value, left: nil, right: nil, parent: node, height: 1)
                node.right = child
                balanceAfterAdd(node: child)
            }
        }
        else {
            node.value = value
        }
    }
}

extension AVLTree {
    public func delete(key: Key) {
        if size == 1 {
            root = nil
            size -= 1
        }
        else if let node = search(key: key, node: root) {
            delete(node: node)
            size -= 1
        }
    }
    
    public func delete(node: Node) {
        if node.isLeaf {
            if let parent = node.parent {
                guard node.isLeftChild || node.isRightChild else {
                    fatalError("Tree is invalid")
                }
                
                if node.isLeftChild {
                    parent.left = nil
                } else if node.isRightChild {
                    parent.right = nil
                }
                
                balanceAfterDelete(node: parent)
            }
            else {
                root = nil
            }
        }
        else {
            if let replacement = node.right?.minimum(), replacement !== node {
                node.key = replacement.key
                node.value = replacement.value
                delete(node: replacement)
            }
            else if let replacement = node.left?.maximum(), replacement !== node {
                node.key = replacement.key
                node.value = replacement.value
                delete(node: replacement)
            }
        }
    }
}

extension AVLTree {
    fileprivate func balanceAfterAdd(node: Node?) {
        var nd = node
        while let current = nd {
            if current.isBalance {
                current.updateHeight()
            }
            else {
                balance(top: current)
                break
            }
            nd = current.parent
        }
    }
    
    fileprivate func balanceAfterDelete(node: Node?) {
        var nd = node
        while let current = nd {
            if current.isBalance {
                current.updateHeight()
            }
            else {
                balance(top: current)
            }
            nd = current.parent
        }
    }
    
    fileprivate func balance(top: Node) {
        guard let parent = top.tallerChild, let node = parent.tallerChild else { return }
        if parent.isLeftChild {
            if node.isLeftChild {
                rotateRight(top: top)
            }
            else {
                rotateLeft(top: parent)
                rotateRight(top: top)
            }
        }
        else {
            if node.isLeftChild {
                rotateRight(top: parent)
                rotateLeft(top: top)
            }
            else {
                rotateLeft(top: top)
            }
        }
    }
    
    fileprivate func rotateLeft(top: Node) {
        guard let parent = top.right else { return }
        let child = parent.left
        parent.left = top
        top.right = child
        afterRotate(top: top, parent: parent, child: child)
    }
    
    fileprivate func rotateRight(top: Node) {
        guard let parent = top.left else { return }
        let child = parent.right
        parent.right = top
        top.left = child
        afterRotate(top: top, parent: parent, child: parent.right)
    }
    
    fileprivate func afterRotate(top: Node, parent: Node, child: Node?) {
        parent.parent = top.parent
        if top.isLeftChild {
            top.parent?.left = parent
        }
        else if top.isRightChild {
            top.parent?.right = parent
        }
        else {
            root = parent
        }
        if let child = child {
            child.parent = top
        }
        top.parent = parent
        
        top.updateHeight()
        parent.updateHeight()
    }
}

extension AVLTree {
    public func traverseInOrder(node: Node?, process: (Node) -> Void) {
        guard let node = node else { return }
        traverseInOrder(node: node.left, process: process)
        process(node)
        traverseInOrder(node: node.right, process: process)
    }
    
    public func traversePreOrder(node: Node?, process: (Node) -> Void) {
        guard let node = node else { return }
        process(node)
        traversePreOrder(node: node.left, process: process)
        traversePreOrder(node: node.right, process: process)
    }
    
    public func traversePostOrder(node: Node?, process: (Node) -> Void) {
        guard let node = node else { return }
        traversePostOrder(node: node.left, process: process)
        traversePostOrder(node: node.right, process: process)
        process(node)
    }
    
    public func traverseLevelOrder(node: Node?, process: (Node) -> Void) {
        guard let node = node else { return }
        var queue = Queue<Node>()
        queue.enQueue(node)
        while !queue.isEmpty {
            if let nd = queue.deQueue() {
                process(nd)
                if let left = nd.left { queue.enQueue(left) }
                if let right = nd.right { queue.enQueue(right) }
            }
        }
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value!)"
        if isRoot {
            s += "_root"
        }
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

extension AVLTree: CustomStringConvertible {
    public var description: String {
        return root?.description ?? "[]"
    }
}
