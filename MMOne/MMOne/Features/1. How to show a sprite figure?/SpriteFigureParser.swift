//
//  SpriteFigureParser.swift
//  MMOne
//
//  Created by kevin wan on 2023/7/5.
//

import Foundation
import CoreGraphics

/// 10 * 10 的雪碧图里面
/// 输入是当前选中的时间
/// index 的计算规则是：向下取整，比如 [0.0, 10) 秒取0，11 ～ 20 取2
/// rect 有四个参数，第三个和第四个是在比率，取 1 / 10
/// 第一个和第二个就按index取位置，例如：
/// 如果位置是 0， 则是 （0 % 10）/ 10.0 = 0.0 ， （1 / 10）/ 10.0 = 0.0 第一行第一个
/// 如果位置是 11，则是 （11 % 10）/ 10.0 = 0.1,  (11 / 10) / 10.0 = 0.1   第二行第二个


final class SpriteFigureParser {
    /// - param: time 单位秒
    /// - return: 返回转换的 rect，转换为 ContentRect 对应的比率
    static func convertToRect(with time: CGFloat) -> CGRect {
        /// 按上面的注释说明，1/10的比率
        let index = Int(ceil(time / 10.0))
        let left = CGFloat(index % 10) / 10.0
        let top = CGFloat(index / 10) / 10.0
        return CGRect(x: left, y: top, width: 0.1, height: 0.1)
    }
}
