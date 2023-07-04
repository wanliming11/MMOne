//
//  LiveRoomRegiter.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/10.
//  注册器使用的动态解析注册表，但这样是通过强制转换为 Swift 的命名空间强转得到的，会存在一定的风险
//  所以这里还是通过正常的方式手动写入依赖注册的方式 （ 后续可以采用代码生成的方式）

import Foundation
import Swinject

// MARK: 通知服务
internal struct NotifServiceKey {
    internal let serviceType: Any.Type
}


extension NotifServiceKey: Hashable {
    static func == (lhs: NotifServiceKey, rhs: NotifServiceKey) -> Bool {
        return lhs.serviceType == rhs.serviceType
    }
    
    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(serviceType).hash(into: &hasher)
    }
}


internal class LiveRoomRegister {
    static let shared = LiveRoomRegister()
    
    let _container = Container()
    var _notifObjs: [NotifServiceKey: [Any]] = [:]
    
    
    init() {
        self.register()
    }
    
    /// 注册依赖对象
    /// 注意这里的实现依然没有解耦业务和底层，所以这里的代码还是需要动态生成，根据依赖配置表。
    private func register() {
        /// 注册基础对象
        _container.register(LiveRoomUIServiceProtocol.self) { _ in
            return LiveRoomBaseUIBoxController.shared
        }.inObjectScope(.container)
        
        _container.register(LiveRoomDanmuBoxServiceProtocol.self) { r in
            let uiService = r.resolve(LiveRoomUIServiceProtocol.self)!
            return LiveRoomDanmuBoxController(uiService: uiService)
        }.inObjectScope(.container)
        
        _container.register(LiveRoomInputBoxServiceProtocol.self) { r in
            let uiService = r.resolve(LiveRoomUIServiceProtocol.self)!
            return LiveRoomInputBoxController(uiService: uiService)
        }.inObjectScope(.container)
    }
    
    
    // MARK: Public
    /// 获取依赖对象，用于接口直接调用
    /// - Parameter protocolType: 依赖协议
    /// - Returns: 依赖对象
    
    public func getService<Service>(_ protocolType: Service.Type) -> Service? {
        return _container.resolve(protocolType)
    }
    
    
    /// 注册通知，用于监听对应的协议变化，这部分是需要被动监听对象的对象
    public func registerNotification<Service>(_ notificationType: Service.Type, _ obj: Service) {
        let notifKey = NotifServiceKey(serviceType: notificationType)
        _notifObjs[notifKey, default: []].append(obj)
    }
    
    /// 推送通知
    public func getNotifiObservers<Service>(_ protocolType: Service.Type) -> [Service]? {
        let notifKey = NotifServiceKey(serviceType: protocolType)
        return _notifObjs[notifKey] as? [Service]
    }
    
    
    // MARK: test
    static func testNotification() {
        /// 1. 注册通知
        let danmuBox = LiveRoomRegister.shared._container.resolve(LiveRoomDanmuBoxServiceProtocol.self)
        LiveRoomRegister.shared.registerNotification(LiveRoomDelegate.self, danmuBox as! LiveRoomDelegate)
        let inputBox = LiveRoomRegister.shared._container.resolve(LiveRoomInputBoxServiceProtocol.self)
        LiveRoomRegister.shared.registerNotification(LiveRoomDelegate.self, inputBox as! LiveRoomDelegate)
        
        /// 2. 发出生命周期分发事件
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            LiveRoomDelegatePublisher
                .notifLiveRoomViewWillAppear()
        }
        LiveRoomDelegatePublisher.notifLiveRoomDidRefresh(source: LiveRoomRefreshType.LiveRoomRefreshTypeChangeRoom)
    }
}
