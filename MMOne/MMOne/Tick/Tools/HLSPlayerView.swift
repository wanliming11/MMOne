//
//  HLSPlayerView.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/23.
//

import Foundation
import AVKit
import SwiftUI

struct HLSPlayerView: UIViewRepresentable {
    let url: String

    func makeUIView(context: Context) -> UIView {
        let player = AVPlayer(url: URL(string: url)!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player.play()
        return UIView(frame: .zero)
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
