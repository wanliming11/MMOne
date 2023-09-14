//
//  SwiftExtension.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/21.
//

import Foundation
import UIKit

extension UIView {
    /// 1. calc proto
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newX) {
            self.frame.origin.x = newX
        }
    }

    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newY) {
            self.frame.origin.y = newY
        }
    }

    /// 2. func
    func isWidthBiggerThenHeight() -> Bool {
        return self.frame.size.width > self.frame.size.height
    }

}
