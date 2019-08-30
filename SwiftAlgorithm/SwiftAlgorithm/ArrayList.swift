//
//  ArrayList.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/8/29.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

fileprivate struct Constant {
    static let DefaultCapacity = 10
}

public class ArrayList<E> {
    
    public private(set) var count: Int = 0
    
    private var currentCapacity: Int = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    private var elements: UnsafeMutablePointer<E>
    
    public init(capacity: Int) {
        let capacity = max(capacity, Constant.DefaultCapacity)
        self.currentCapacity = capacity
        self.elements = UnsafeMutablePointer<E>.allocate(capacity: capacity)
    }
    
    public convenience init() {
        self.init(capacity: Constant.DefaultCapacity)
    }
    
    public func insert(_ element: E, at index: Int) {
        rangeCheckForAdd(at: index)
        increaseCapacityIfNeeded(count + 1)
        for i in stride(from: count, to: index, by: -1) {
            (elements + i).initialize(to: elements[i - 1])
        }
        (elements + index).initialize(to: element)
        count += 1
    }
    
    public func append(_ element: E) {
        insert(element, at: count)
    }
    
    @discardableResult
    public func remove(at index: Int) -> E {
        rangeCheck(for: index)
        decreaseCapacityIfNeeded()
        let old = elements[index]
        for i in (index + 1)..<count {
            (elements - 1).initialize(to: elements[i])
        }
        count -= 1
        return old
    }
    
    public func removeFirst() {
        remove(at: 0)
    }
    
    public func removeLast() {
        remove(at: count - 1)
    }
    
    public func removeAll() {
        count = 0
    }
    
    public func set(_ element: E, at index: Int) {
        rangeCheck(for: index)
        (elements + index).initialize(to: element)
    }
    
    public subscript(index: Int) -> E {
        rangeCheck(for: index)
        return elements[index]
    }
    
    private func rangeCheck(for index: Int) {
        if isEmpty || index < 0 || index >= count {
            fatalError("Index out of range")
        }
    }
    
    private func rangeCheckForAdd(at index: Int) {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
    }
    
    private func increaseCapacityIfNeeded(_ capacity: Int) {
        if self.currentCapacity > capacity {
            return
        }
        let newCapacity = self.currentCapacity + (self.currentCapacity >> 1)
        copyArrayListToNewSpace(capacity: newCapacity)
    }
    
    private func decreaseCapacityIfNeeded() {
        if self.currentCapacity > 50 && (Double(count) / Double(self.currentCapacity) < 0.25) {
            let newCapacity = max(Constant.DefaultCapacity, self.currentCapacity >> 1)
            copyArrayListToNewSpace(capacity: newCapacity)
        }
    }
    
    private func copyArrayListToNewSpace(capacity: Int) {
        let newElements = UnsafeMutablePointer<E>.allocate(capacity: capacity)
        for i in 0..<count {
            (newElements + i).initialize(to: elements[i])
        }
        let oldElements = elements
        elements = newElements
        oldElements.deinitialize(count: self.currentCapacity)
        oldElements.deallocate()
        self.currentCapacity = capacity
    }
}

extension ArrayList: CustomStringConvertible {
    public var description: String {
        var s = "["
        for i in 0..<count {
            s += "\(elements[i])"
            if i < count - 1 {
                s += ", "
            }
        }
        return s + "]"
    }
}
