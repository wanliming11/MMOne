//
//  LiveRoomDelegatePublisher.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/11.
//  这个主要承担容器本身的状态分发，包括各种生命周期的分发以及必要的关键状态的分发

import Foundation
import Combine

class LiveRoomDelegatePublisher {
    
    /// 直播间已重载，用于重新加载自己的业务
    /// - parameter source: 触发刷新的场景
    static func notifLiveRoomDidRefresh(source: LiveRoomRefreshType) {
        let notif = LiveRoomRegister.shared.getNotifiObservers(LiveRoomDelegate.self)
        notif?.forEach { obj in
            obj.liveRoomDidRefresh(source: LiveRoomRefreshType.LiveRoomRefreshTypeChangeRoom)
        }
    }
    
    /// 通知直播间即将加载
    static func notifLiveRoomViewWillAppear() {
        let notif = LiveRoomRegister.shared.getNotifiObservers(LiveRoomDelegate.self)
        notif?.forEach { obj in
            obj.liveRoomWillAppear()
        }
    }
}
