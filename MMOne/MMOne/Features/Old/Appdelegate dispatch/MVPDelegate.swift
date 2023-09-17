//
//  MVPDelegate.swift
//  MVP
//
//  Created by Murloc Wan on 2023/5/10.
//

import UIKit
/// 1. SwiftUI 的 main app 里面通过注解生成一个 delegate，注意只有一个，这个相当于一个约定，会自动和类产生关联。
/// 2. 从 AppDelegate 中分发出来，在 Swift 是通过一个注解设置 @UIApplicationDelegate
/// 3. 接下来就是从这里面再往下进行生命周期的分发，在 Swift 里面虽然有 Mirror，但只能获取到方法名，无法获得完整的方法签名，但 NSObjectProtocol 可以获取到
/// 4. 派发目前是使用的同步派送
/// 5. 因为 Appdelegate 的生命周期比较早，所以需要更早的时机去注册对象，让对应的对象可以

class MVPDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
                    -> Bool {
        AppDeleagateDispatcher.default.register(ADAppDelegate())
        AppDeleagateDispatcher.default.register(HomeAppDelegate())

        /// 这里由于动态派发的实现逻辑比较容易出错，所以这里手动去遍历派发
        /// 这里带来的问题就是这个 MVPDelegate 是一个更高的位置去调度，也就是要单独依赖
        for delegate in AppDeleagateDispatcher.default.delegates {
            _ = delegate?.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // 分发 applicationWillResignActive(_:) 方法
        AppDeleagateDispatcher.default.dispatch(#selector(applicationWillResignActive(_:)))
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // 分发 applicationDidEnterBackground(_:) 方法
        AppDeleagateDispatcher.default.dispatch(#selector(applicationDidEnterBackground(_:)))
    }
}
