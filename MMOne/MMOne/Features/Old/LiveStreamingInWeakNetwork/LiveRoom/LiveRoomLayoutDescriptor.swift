//
//  LiveRoomLayoutDescriptor.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/9.
//  设计思想：对应的子模块不应该直接获取整个父容器的视图控制权，而是应该知道自己应该
//  加到哪个层级，内部再根据优先级调整在 z 轴上的顺序。
//  业务内部的视图层级由业务内部决定，容器再添加到对应的层级上面，类似于一个大组织里面分成很多部门，每个
//  部门负责各自的职责，在自己的职能范围内再处理自己的内部业务。
//  而这一部分属于 UI 框架提供的基础业务功能，应该由基础框架Box来负责功能输出。

import Foundation

/// 理由间隙的目的是为了让扩展成为可能
enum LiveRoomLayoutDescriptor: Int, CaseIterable {
    /// 最底部的播放器视图
    case LiveRoomLayoutVideo = 0
    /// 上面的 Tab 层，主要是 Tab 容器，弹幕等
    case LiveRoomLayoutTab = 1
    /// 礼物层，除了活动的弹框以外，礼物的展示层级最高
    case LiveRoomLayoutGift = 100
    /// 活动层，活动展示层，最高
    case LiveRoomLayoutActivity = 999
}



