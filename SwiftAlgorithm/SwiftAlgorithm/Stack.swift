//
//  Stack.swift
//  SwiftAlgorithm
//
//  Created by Phoenix on 2019/7/20.
//  Copyright © 2019 Phoenix. All rights reserved.
//

import Foundation

public struct Stack<E> {
    fileprivate var array = [E]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ element: E) {
        array.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> E? {
        return array.popLast()
    }
    
    public func top() -> E? {
        return array.last
    }
    
    public mutating func clear() {
        array.removeAll()
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topLine = "-----Stack Top------\n"
        let bottomLine = "\n----Stack Bottom----\n"
        let elements = array.reversed().map { "\($0)" }.joined(separator: "\n")
        return topLine + elements + bottomLine
    }
}
