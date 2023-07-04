//
//  Swift5_8_features.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/1.
//

import Foundation
import SwiftUI

/// 1. lazy  2. #file #filePath
struct LazyVarView: View {
    var body: some View {
        VStack {
            lazy var time = 0
            Text("first \(time)")
        }
        Text("Hello, world!")
            .padding()
            .onAppear() {
                print(#file)
                print(#filePath)
                jump(using: [Dog()])
            }
    }
}

/// 3. optional generic
func optionalDouble<T: Numeric>(_ num: T?) -> T {
    let numToDouble = num ?? 0
    return numToDouble * 2
}

/// 4. 现在支持强制转换模式中的集合向下转换
class Pet {}
class Dog: Pet {
    func jump() { }
}

func jump(using pets: [Pet]) {
    switch pets {
    case let pets as [Dog]:
        for c in pets {
            c.jump()
        }
    default:
        print("No jump")
    }
}

/// 5. 向后部署
extension Text {
    @backDeployed(before: iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4)
    @available(iOS 14.0, macOS 11, tvOS 14.0, watchOS 7.0, *)
    public func monospaced(_ isActive: Bool) -> Text {
        fatalError("Implementation here")
    }
}
