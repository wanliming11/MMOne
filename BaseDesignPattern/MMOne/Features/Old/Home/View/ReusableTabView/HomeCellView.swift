//
//  ReusableTabView.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/18.
//

import SwiftUI
import SwiftUIX

enum HomeCellTye: CaseIterable {
    case Video
    case Normal
    case Banner
    case OnlineHLSStream
    case OnlineRTMPStream
}

struct HomeCellView: View {
    let tabs: [Item] = [
        Item(id: 1, title: "banner", images: ["https://n.sinaimg.cn/sinakd20220729ac/320/w2048h3072/20220729/6733-35cc7d325743fbacb0bf56eeedd16c67.jpg","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F01%2F20200401092826_osrpf.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1684749733&t=9b5128800b679c4503d76f27940db1c3", "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202008%2F06%2F20200806225449_uqyfm.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1684749733&t=ab018379d23f2fca070b9af3e0df6a08"]
             , type: .Banner),
        Item(id: 2, title: "video",videoUrl: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4", type: .Video),
        Item(id: 3, title: "normal", images: ["https://n.sinaimg.cn/sinakd20220729ac/320/w2048h3072/20220729/6733-35cc7d325743fbacb0bf56eeedd16c67.jpg"], type: .Normal),
        Item(id: 4, title: "video",videoUrl: "https://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8", type: .OnlineHLSStream),
        Item(id: 5, title: "video",videoUrl: "http://tc-tct.douyucdn2.cn/dyliveflv3/216555rLfFg0G4H7_900.flv?wsAuth=ae4e2c3ff4af911ada71b5053360caad&token=app-ios-0-216555-9bbcfe1f4f0b1f74add8b65db40cf4b7ec1e84203d80ced8&logo=0&expire=60&did=aa5fb109bf10f291c66d159d00001621&ver=7.490&pt=1&st=0&preview=1&origin=tct", type: .OnlineRTMPStream)
    ]
    let columns = [GridItem(.fixed(150)), GridItem(.fixed(150))]
    // 遍历 column

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(tabs, id:\.self.id) { tab in
                    switch tab.type {
                    case .OnlineRTMPStream:
                        RTMPPlayerView(url: tab.videoUrl)
                            .frame(height: 100)
                    case .OnlineHLSStream:
                        HLSPlayerView(url: tab.videoUrl)
                            .frame(height: 100)
                    case .Video:
                        HomeVideoCell(url: tab.videoUrl)
                            .frame(height: 100)
                        
                    case .Normal:
                        HomeNormalCell(title: tab.title, imageUrl: tab.images[0])
                            .frame(height: 100)
                        
                    case .Banner:
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
        let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10", "Item 11", "Item 12", "Item 13", "Item 14", "Item 15", "Item 16", "Item 17", "Item 18", "Item 19", "Item 20"]
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
