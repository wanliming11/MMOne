//
//  AppDeleagateDispatcher.swift
//  MVP
//
//  Created by Murloc Wan on 2023/5/12.
//

import Foundation
import UIKit

class AppDeleagateDispatcher {
    static let `default` = AppDeleagateDispatcher()
    var delegates: [UIApplicationDelegate?] = []

    private lazy var methods: [String] = {
        var methodCount: UInt32 = 0

        // 获取协议信息
        guard let protocolInfo = NSProtocolFromString("UIApplicationDelegate") else {
            return []
        }

        // 获取方法描述符列表
        guard let methodDescList = protocol_copyMethodDescriptionList(protocolInfo, false, true, &methodCount) else {
            return []
        }

        // 遍历方法描述符列表并获取方法名
        var methodNameList = [String]()
        for index in 0..<Int(methodCount) {
            let desc = methodDescList[index]
            if let name = desc.name {
                let selectorName = NSStringFromSelector(name)
                methodNameList.append(selectorName)
            }
        }

        // 释放内存
        free(methodDescList)
        return methodNameList
    }()

    // 运行时调用分发
    /// 单一派发
    private func dispatch(_ selector: Selector, to delegate: UIApplicationDelegate?) {
        if let delegate = delegate, delegate.responds(to: selector) {
            let implementation = class_getMethodImplementation(type(of: delegate), selector)
            typealias FunctionType = @convention(c) (AnyObject, Selector) -> Void
            let function = unsafeBitCast(implementation, to: FunctionType.self)
            function(delegate, selector)
        }
    }

    /// 集体派发
    func dispatch(_ selector: Selector) {
        for delegate in delegates {
            dispatch(selector, to: delegate)
        }
    }

    /// 注册需要派发的对象
    func register(_ delegate: UIApplicationDelegate?) {
        for delega in delegates {
            guard delega !== delegate else { return}
        }

        delegates.append(delegate)
    }
}
