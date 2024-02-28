//
//  Closure.swift
//  MMOne
//
//  Created by kevin wan on 2023/12/5.
//

import Foundation

class Closure {
    var value: Int
    var curRun: (() -> Void)?

    init(value: Int) {
        self.value = value
    }

    func myClosure() {
        var instance = Closure(value: 11)
        var value = 12
        func add(_ value: inout Int) {
            instance.value = 100 + value
            print(instance.value)
        }

        add(&value)
        let closure = {[weak self] (name: String) in
            print("Hello, \(name) \(self?.value ?? 0)")
        }
        closure("Kevin")
    }

    func eacapingClosure(_ run: @escaping () -> Void) {
        curRun = run
    }

    func test() {
        if let run = curRun {
            run()
        }
        curRun?()
    }

    // tailing closure
    func tailClosure(_ closure: () -> Void) {
        closure()
    }

    func test2() {
        self.tailClosure {
            print("Hello")
        }
    }

    // AutoClosure
    @discardableResult func autoClosure(_ input: @autoclosure () -> Bool) -> Bool {
        input()
    }

    func test3() {
        self.autoClosure(5 > 3)
    }

}
