//
//  ReusableTabView.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/18.
//

import SwiftUI
import SwiftUIX

enum HomeCellTye: CaseIterable {
    case video
    case normal
    case banner
    case onlineHLSStream
    case onlineRTMPStream
}

struct HomeCellView: View {
    let tabs: [Item] = [
        Item(id: 2, title: "video",
             videoUrl: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
             type: .video),
        Item(id: 3, title: "normal",
images: ["https://n.sinaimg.cn/sinakd20220729ac/320/w2048h3072/20220729/6733-35cc7d325743fbacb0bf56eeedd16c67.jpg"],
             type: .normal),
        Item(id: 4, title: "video",
             videoUrl: "https://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8",
             type: .onlineHLSStream),
        Item(id: 5, title: "video",
             videoUrl: "https://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8",
             type: .onlineRTMPStream)
    ]
    let columns = [GridItem(.fixed(150)), GridItem(.fixed(150))]
    // 遍历 column

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(tabs, id: \.self.id) { tab in
                    switch tab.type {
                    case .onlineRTMPStream:
                        RTMPPlayerView(url: tab.videoUrl)
                            .frame(height: 100)
                    case .onlineHLSStream:
                        HLSPlayerView(url: tab.videoUrl)
                            .frame(height: 100)
                    case .video:
                        HomeVideoCell(url: tab.videoUrl)
                            .frame(height: 100)
                    case .normal:
                        HomeNormalCell(title: tab.title, imageUrl: tab.images[0])
                            .frame(height: 100)
                    case .banner:
                        HomeBannerCell(images: tab.images)
                            .frame(height: 100)

                    }
                }
            }
        }
    }
}

// MARK: 单个标题
struct Item: Identifiable {
    let id: Int
    let title: String
    var images: [String] = []
    var videoUrl: String = ""
    let type: HomeCellTye
}

struct HomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7",
                     "Item 8", "Item 9", "Item 10", "Item 11", "Item 12", "Item 13",
                     "Item 14", "Item 15", "Item 16", "Item 17", "Item 18", "Item 19",
                     "Item 20"]
        return ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            GeometryReader { geometry in
                                Text(item)
                                    .frame(height: geometry.size.height)
                                    .background(Color.blue)
                            }
                            .frame(height: CGFloat.random(in: 50...150))
                        }
                    }
                    .padding()
                }
    }
}
