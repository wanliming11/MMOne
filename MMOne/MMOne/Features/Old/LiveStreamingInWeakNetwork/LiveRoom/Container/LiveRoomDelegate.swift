//
//  LiveRoomDelegate.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/10.
//  这是一个生命周期分发的协议，用来把直播间的关键生命周期进行分发，让业务可以进行
//  由于容器的存在，所以注册进来的业务会自动遵循 init 和 deinit, 不再需要 boxLoad 和 boxRecycle 两个生命周期，
//  直接只分发 boxRefresh 的生命周期会让语意更清晰

import Foundation

public enum LiveRoomRefreshType {
    /// 登录信息变更
    case liveRoomRefreshTypeRegister
    /// 切换房间
    case liveRoomRefreshTypeChangeRoom
}

protocol LiveRoomDelegate: AnyObject {
    /// 直播间 view 和 基础布局已完成，主要是应对直播间的 PlaceHolder 场景
    /// 在第一次展示出来的时候能先占位
    /// 这里需要确认的是是否和 VC 的 willAppear 的生命周期类似
    func liveRoomWillAppear()

    /// 直播间已重载，用于重新加载自己的业务
    /// - parameter source: 触发刷新的场景
    func liveRoomDidRefresh(source: LiveRoomRefreshType)

    /// 直播间将要重载，用于做一些重置的操作
    /// - parameter source: 触发刷新的场景
    func liveRoomWillRefresh(source: LiveRoomRefreshType)

    /// 布局即将旋转
    /// - parameter isFullScreen: 目标方向
    func liveRoomLayoutWillRotate(isFullScreen: Bool)

    /// 布局已经旋转
    /// - parameter isFullScreen: 目标方向
    func liveRoomLayoutDidRotate(isFullScreen: Bool)
}
