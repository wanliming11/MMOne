//
//  LiveRoomBaseUIBoxController.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/10.
//  这个控制器的主要作用提供给其他 box 可以调用更新 UI 的方式。

import Foundation
import SwiftUI

class LiveRoomBaseContainerView: UIView {
    static let shared = LiveRoomBaseContainerView(frame: CGRect(x: 0, y: 0,
                                                                width: UIScreen.main.bounds.width,
                                                                height: UIScreen.main.bounds.height))

    private var _layoutViewsMap: [LiveRoomLayoutDescriptor: UIView] = [:]

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateViewMap(_ descriptor: LiveRoomLayoutDescriptor, _ view: UIView) {
        _layoutViewsMap[descriptor] = view
    }

    func requestUpdate(_ descriptor: LiveRoomLayoutDescriptor, _ view: UIView) {
        _layoutViewsMap[descriptor]?.addSubview(view)
    }
}

struct LiveRoomBaseUIBoxController: LiveRoomUIServiceProtocol {
    static let shared = LiveRoomBaseUIBoxController()
    let curShowView: LiveRoomBaseContainerView = LiveRoomBaseContainerView.shared

    // MARK: LiveRoomUIServiceProtocol
    func requestUpdateUI(_ layoutDescriptor: LiveRoomLayoutDescriptor, _ view: UIView) {
        curShowView.requestUpdate(layoutDescriptor, view)
    }
}

struct LiveRoomBaseUIBoxView: UIViewRepresentable {
    /// 1. 全屏的容器视图
    let containerView = LiveRoomBaseContainerView.shared

    // MARK: UIViewRepresentable
    func makeUIView(context: Context) -> UIView {
        /// 2. 一次遍历枚举中的变量按顺序进行添加
        for descriptor in LiveRoomLayoutDescriptor.allCases {
            let view = UIView(frame: CGRect(x: 0, y: 0,
                                            width: UIScreen.main.bounds.width,
                                            height: UIScreen.main.bounds.height))
            containerView.addSubview(view)
            view.backgroundColor = UIColor.brown
            containerView.updateViewMap(descriptor, view)
        }

        return containerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // 在需要更新视图时被调用
    }
}
