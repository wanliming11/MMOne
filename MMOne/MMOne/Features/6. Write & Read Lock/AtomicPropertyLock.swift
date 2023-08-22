//
//  AtomicPropertyLock.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/21.
//

import Foundation

class AtomicPropertyLock {
    private var value = 0
    let queue = DispatchQueue(label: "AtomicPropertyLockQueue")

    func setValue(_ newValue: Int) {
        queue.sync {
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


