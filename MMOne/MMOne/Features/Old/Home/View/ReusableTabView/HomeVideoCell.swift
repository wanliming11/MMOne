//
//  HomeVideoCell.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/22.
//  视频播放 Cell

import SwiftUI
import AVKit

struct HomeVideoCell: View {
    @State var url: String
    private var player: AVPlayer {
        AVPlayer(url: URL(string: url)!)
    }

    var body: some View {
        VStack {
            GeometryReader { geometry in
                VideoPlayer(player: player)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onAppear() {
                        player.seek(to: .zero)
                        player.play()
                        addObserver()
                    }
                    .onDisappear() {
                        removeObserver()
                    }
            }
        }
        
    }
    
    
    // MARK: observer
    func addObserver() {

        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem,
                                               queue: nil) { notif in // 3
            player.seek(to: .zero) // 4
            player.play() // 5
        }
    }

    func removeObserver() {
    NotificationCenter.default.removeObserver(self,  // 6
                                              name: .AVPlayerItemDidPlayToEndTime,
                                              object: nil)

            }
}


struct HomeVideoCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeVideoCell(url: "")
    }
}
