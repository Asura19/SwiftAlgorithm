//
//  Queue.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/8/23.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

public struct Queue<E> {
    private var array = [E?]()
    private var head = 0
    
    public var count: Int {
        return array.count - head
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public mutating func enQueue(_ element: E) {
        array.append(element)
    }
    
    @discardableResult
    public mutating func deQueue() -> E? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        return element
    }
    
    public var front: E? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        if isEmpty {
            return "The queue is Empty"
        }
        let elements = array.reversed()
            .compactMap { $0 }
            .map { "\($0)" }
            .joined(separator: ", ")
        var bottom = "\n"
        for _ in 0..<elements.count - 1 {
            bottom += "—"
        }
        
        bottom += "⇀"
        return elements + bottom
    }
}
