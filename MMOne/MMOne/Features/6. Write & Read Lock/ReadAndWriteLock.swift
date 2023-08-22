//
//  ReadAndWriteLock.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/21.
//

import Foundation

class ReadAndWriteLock {
    let queue = DispatchQueue(label: "Read&WriteLockQueue", attributes: .concurrent)
    private var value: Int = 0

    func setValue(_ newValue: Int) {
        queue.async(flags: .barrier) {
            self.value = newValue
        }
    }

    func getValue() -> Int {
        var result = 0
        queue.sync {
            result = self.value
        }
        return result
    }
}
