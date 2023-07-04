//
//  TimeWindow.swift
//  MVP
//
//  Created by Murloc Wan on 2023/5/8.
//

import Foundation

/// 策略加访问
class TimeWindow: TimeStrategy, WindowAccess {
    var time: CGFloat = 1  // 秒
    var frequency: Int = 2
    
    var lock: NSLock = NSLock()
    var lastTime: CGFloat? = nil
    var count: Int = 0
    
    func tryAccess() -> Bool {
        /// 1. 在时间窗口内尝试访问lock，如果不能获取到，直接返回 false
        /// 如果能访问到，则进入后，先判断窗口时间是否满足，如果已经超出了一个时间窗口，则重置计数
        /// 然后判断访问的频度，
        if lock.lock(before: Date(timeIntervalSinceNow: TimeInterval(time))) {
            defer { lock.unlock() }
            let curTime = CFAbsoluteTimeGetCurrent()  /// 毫秒
            if lastTime == nil { lastTime = curTime } /// 初始化
            print("access time is \(curTime), last time is \(lastTime!)")
            if curTime - lastTime! > Double(time) {
                count = 0
                lastTime = curTime
            }
            
            count += 1
            return count <= frequency
        }
        
        return false
    }
    
}


/// 时间策略
protocol TimeStrategy {
    var time: CGFloat { get set }               /// 时间
    var frequency: Int { get set }              /// 频率
}

/// 时间访问窗口函数，
protocol WindowAccess {
    func tryAccess() -> Bool
}
