//
//  1. NSNotification.swift
//  MMOne
//
//  Created by kevin wan on 2024/2/26.
//

import Foundation

protocol CustomNotificationObservable: AnyObject {
    func hanleNotification(_ name: String, _ obj: Any?)
}

class CustomNotificationCenter<T: CustomNotificationObservable> {
    static var shared: CustomNotificationCenter {
        return CustomNotificationCenter()
    }

    // 1. trouble one: can't know how to name "objs".
    // 2. trouble two: the chain of T
    // 7. trouble seven: why to change weakbox to NSHashTable
    private init() {}
    private var observers: [String: NSHashTable<T>] = [:]
    // 5. trouble five: can't understand the queue api
    private var queue = DispatchQueue(label: "NotificationQueue", attributes: .concurrent)

    // 3. trouble three: the naming of params
    func addNotificationObserver(_ observer: T, forName name: String) {
        queue.async(flags: .barrier) {[weak self] in
            self?.observers[name, default: NSHashTable<T>.weakObjects()].add(observer)
        }
    }

    // 4. trouble four: weakbox must contain a object
    // 6. trouble six: weak self must [weak self]
    func removeNotificationObserver(_ observer: T, forName name: String) {
        queue.async(flags: .barrier) {[weak self] in
            self?.observers[name]?.remove(observer)
        }
    }

    func postNotification(_ name: String, _ obj: Any?) {
        queue.async {[weak self] in
            self?.observers[name]?.allObjects.forEach({ observer in
                observer.hanleNotification(name, obj)
            })
        }
    }

    private class WeakBox<N: AnyObject> {
        var value: N?

        init(value: N) {
            self.value = value
        }
    }
}

class CustomObserverOne: CustomNotificationObservable {
    func hanleNotification(_ name: String, _ obj: Any?) {
        print(name)
    }
}

class CustomObserverTwo: CustomNotificationObservable {
    func hanleNotification(_ name: String, _ obj: Any?) {
        print(name)
    }
}

class TestNotification {
    func test() {
        let one = CustomObserverOne()
        let two = CustomObserverTwo()
        CustomNotificationCenter.shared.addNotificationObserver(one, forName: "hello1")
        CustomNotificationCenter.shared.addNotificationObserver(two, forName: "hello2")
    }
}
