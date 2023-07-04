//
//  LiveRoomUIService.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/10.
//

import Foundation
import UIKit

protocol LiveRoomUIServiceProtocol {
    /// 请求将自己的 UI 更新到指定的层级上, 注意这是唯一的一个方法，可以
    func requestUpdateUI(_ layoutDescriptor: LiveRoomLayoutDescriptor, _ view: UIView)
}
