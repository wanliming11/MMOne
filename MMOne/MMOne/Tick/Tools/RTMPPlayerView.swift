//
//  RTMPPlayerView.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/23.
//

import SwiftUI
import AVKit
import VideoToolbox

struct RTMPPlayerView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> UIView {
//        let rtmpConnection = RTMPConnection()
//        let rtmpStream = RTMPStream(connection: rtmpConnection)
//        let player = AVPlayer(url: rtmpConnection.uri!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        player.play()
//
//        rtmpConnection.connect(url)
//        rtmpStream.attachAudio(AVCaptureDevice.default(for: .audio)) { error in
//            // Handle audio capture device errors
//        }
//        rtmpStream.attachCamera(DeviceUtil.device(withLocalizedName: "", mediaType: .audio)) { error in
//            // Handle camera errors
//        }
        return UIView(frame: .zero)
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

