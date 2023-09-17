//
//  LiveRoomView.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/8.
//

import SwiftUI
import UIKit

struct LiveRoomView: View {
    var id: Int

    var body: some View {
        ZStack {
            Color.red
            LiveRoomBaseUIBoxView().id("LiveRoomBaseUI")
        }
    }
}

struct LiveRoomView_Previews: PreviewProvider {
    static var previews: some View {
        LiveRoomView(id: 11)
    }
}
