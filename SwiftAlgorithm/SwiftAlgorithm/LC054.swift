//
//  LC054.swift
//  SwiftAlgorithm
//
//  Created by phoenix on 2022/2/23.
//  Copyright © 2022 Phoenix. All rights reserved.
//

import Foundation

struct MatrixSpiralIterator {

    typealias Index = (row: Int, col: Int, idx: Int)

    let rowCount: Int
    let colCount: Int

    private var top: Int
    private var left: Int
    private var bottom: Int
    private var right: Int
    private let total: Int

    init(rowCount: Int, colCount: Int) {
        assert(rowCount >= 1 && colCount >= 1)
        self.rowCount = rowCount
        self.colCount = colCount
        self.top = 0
        self.left = 0
        self.bottom = rowCount - 1
        self.right = colCount - 1
        total = rowCount * colCount
    }

    var current: Index?

    mutating func next() -> Index? {
        guard var c = current else {
            current = (0, 0, 0)
            return self.current
        }
        
        if c.idx == total - 1 {
            return nil
        }
        
        if rowCount == 1 {
            current = c.col < right ? (0, c.col + 1, c.idx + 1) : nil
            return current
        }
        if colCount == 1 {
            current = c.row < bottom ? (c.row + 1, 0, c.idx + 1) : nil
            return current
        }
        
        if c.row == top && c.col < right {
            c.col += 1
        }
        else if c.col == right && c.row < bottom {
            c.row += 1
        }
        else if c.row == bottom && c.col > left {
            c.col -= 1
        }
        else if c.col == left && c.row > top {
            c.row -= 1
        }
        if c.row == top, c.col == left {
            top += 1
            left += 1
            bottom -= 1
            right -= 1
            c.row = top
            c.col = left
        }
        c.idx += 1
        current = c
        return current
    }

}

extension LeetCode {
    
    static func printMatrixBySpiral<T>(_ matrix: [[T]]) {
        guard isMatrix(matrix) else {
            assert(false, "not a matrix")
            return
        }
        let rowCount = matrix.count
        let colCount = matrix[0].count
        var iterator = MatrixSpiralIterator(rowCount: rowCount, colCount: colCount)

        while let index = iterator.next() {
            print("\(index.idx): \(matrix[index.row][index.col])")
        }
    }

    private static func isMatrix<T>(_ matrix: [[T]]) -> Bool {
        if matrix.count == 0 { return false }
        let colCount = matrix[0].count
        return matrix.filter { $0.count != colCount }.count == 0
    }
}

