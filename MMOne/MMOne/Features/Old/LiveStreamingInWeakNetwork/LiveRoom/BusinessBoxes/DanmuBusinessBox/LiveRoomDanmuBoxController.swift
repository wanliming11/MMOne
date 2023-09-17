//
//  LiveRoomBaseUIBoxController.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/10.
//

import Foundation
import UIKit
import SwiftUI

class LiveRoomDanmuBoxController: LiveRoomDanmuBoxServiceProtocol, LiveRoomDelegate {
    private var uiService: LiveRoomUIServiceProtocol

    init(uiService: LiveRoomUIServiceProtocol) {
        self.uiService = uiService
    }

    // MARK: Interface
    func showDanmu() {
        let myViewController = DanmuViewController(rootView: DanmuView())
        myViewController.view.frame = CGRect(x: 0, y: 100, width: 100, height: 50)
        uiService.requestUpdateUI(LiveRoomLayoutDescriptor.liveRoomLayoutVideo, myViewController.view)
    }

    // MARK: Notifi
    func liveRoomWillAppear() {
        print("willAppear")
        showDanmu()
    }

    func liveRoomDidRefresh(source: LiveRoomRefreshType) {
        print("didRefresh")
    }

    func liveRoomWillRefresh(source: LiveRoomRefreshType) {
        print("willRefresh")
    }

    func liveRoomLayoutWillRotate(isFullScreen: Bool) {
    }

    func liveRoomLayoutDidRotate(isFullScreen: Bool) {

    }
}

// MARK: Custom View
struct DanmuView: View {
    var body: some View {
        VStack {
            Text("Hello danmu!")
        }
    }
}

class DanmuViewController: UIHostingController<DanmuView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: DanmuView())
    }

    override init(rootView: DanmuView) {
          super.init(rootView: rootView)
      }
}
