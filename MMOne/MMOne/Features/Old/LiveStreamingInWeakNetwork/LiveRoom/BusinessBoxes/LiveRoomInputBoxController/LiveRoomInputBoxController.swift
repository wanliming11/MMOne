//
//  LiveRoomInputBoxController.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/15.
//

import Foundation
import UIKit
import SwiftUI

class LiveRoomInputBoxController: LiveRoomDelegate, LiveRoomInputBoxServiceProtocol {
    private var uiService: LiveRoomUIServiceProtocol

    init(uiService: LiveRoomUIServiceProtocol) {
        self.uiService = uiService
    }

    // MARK: Interface
    func showInput() {
        let myViewController = InputViewController(rootView: InputView())
        myViewController.view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let service = LiveRoomRegister.shared.getService(LiveRoomUIServiceProtocol.self)
        service?.requestUpdateUI(LiveRoomLayoutDescriptor.liveRoomLayoutTab, myViewController.view)
    }

    // MARK: Notifi
    func liveRoomWillAppear() {
        print("\(self) + willAppear")
        showInput()
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

struct InputView: View {
    var body: some View {
        VStack {
            Text("Hello input!")
        }
    }
}

class InputViewController: UIHostingController<InputView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: InputView())
    }

    override init(rootView: InputView) {
          super.init(rootView: rootView)
      }
}

struct InputUIView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: Context) {

    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let inputView = InputView()
            .background(.blue)
            .frame(width: 100, height: 50)
        let hostingController = UIHostingController(rootView: inputView)

        view.addSubview(hostingController.view)
        return view
    }
}
