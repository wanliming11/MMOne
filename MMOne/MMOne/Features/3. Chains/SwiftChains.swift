//
//  SwiftChains.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/1.
//

import Foundation

extension String {
    /// 1. 拼接出的对象还是 String，但是可以持续拼接，每次拼接后就是对当前拼接元素进行作用域
    func append(newElement element: String) -> String {
        return self + element
    }
    
}
