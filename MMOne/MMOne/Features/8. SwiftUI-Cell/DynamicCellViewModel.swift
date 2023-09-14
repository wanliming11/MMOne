//
//  DynamicCellViewModel.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import Foundation

class DynamicCellViewModel: ObservableObject {
    struct VideoItem {
        var url: String
    }

    struct ImageItem {
        var url: String
    }

    struct NotifViewModel {
        var content: String
    }

    struct HeadViewModel {
        var image: String
        var name: String
        var time: String
        var content: String
    }

    struct TextViewModel {
        var content: String
    }

    struct ImageViewModel {
        enum ImageType {
            case Image
            case Video
            case Gif
        }

        struct ImageItem {
            var url: String
            var type: ImageType
        }
        var imgs: [ImageItem]
    }

    struct VoteViewModel {
        var id = UUID()
        var title: String
        var options: [String]
        var num: Int
    }

    struct TopicViewModel {
        struct Item {
            var id: UUID = UUID()
            var icon: String
            var text: String
        }
        var topics: [Item]
    }

    struct StandViewModel {
        struct Item {
            var id: UUID = UUID()
            var icon: String
            var num: String
        }
        var items: [Item]
    }

    struct ShareViewModel {
        struct Item {
            var id: UUID = UUID()
            var icon: String
            var text: String
        }
        var items: [Item]
    }

    @Published var notifViewModel: NotifViewModel
    @Published var headViewModel: HeadViewModel
    @Published var textViewModel: TextViewModel
    @Published var imageViewModel: ImageViewModel
    @Published var voteViewModel: VoteViewModel
    @Published var topicViewModel: TopicViewModel
    @Published var standViewModel: StandViewModel
    @Published var shareViewModel: ShareViewModel


    //MARK: Optional

    init() {
        notifViewModel = NotifViewModel(content: "有人@你了")
        headViewModel = HeadViewModel(image: "head", name: "Kevin", time: "1小时前", content: "我是一段文字")
        textViewModel = TextViewModel(content:
                                        """
                                        长夜里，我孤独地躺在床上，看着窗外的明月光，仿佛是一层薄霜铺在了大地上。我抬起头，注视着那明亮的圆月，不由得想起了远方的故乡，想起了那些我曾经爱过的人和事。我的内心充满了思念和渴望，仿佛能听到远方的山川河流和亲人的声音。这时，我不禁想起了一首诗。这首诗是李白写的，正是这首《静夜思》。床前明月光，疑是地上霜。这两句简单而又深刻的诗句，让我感受到了李白独特的诗意和情感。李白是唐代最著名的诗人之一，他的诗歌充满了豪迈、奔放和激情。他的诗句多是意境深远，情感真挚，给人留下了深刻的印象。他的《将进酒》、《庐山谣》、《夜泊牛渚怀古》、《夜泊秦淮》等诗篇，都是经典之作。回到现实，我依旧躺在床上，思绪万千。我感慨人生短暂，充满了不可预知的变数，但是我们依旧要珍惜每一刻，让自己的生命变得更加有意义。在这个寂静的夜晚，我感谢李白留给我们的这首美妙的诗篇，它让我更加深刻地理解了生命的意义和价值。\n- 李白，《静夜思》  \n 床前明月光，疑是地上霜。
                                             举头望明月，低头思故乡。                                                                                                                                            
                                      """
                                        )
        imageViewModel = ImageViewModel(imgs: [ImageViewModel.ImageItem(url: "https://img0.baidu.com/it/u=1910540168,2901566440&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=332", type: .Image),
                                               ImageViewModel.ImageItem(url: "https://www.2008php.com/2012_Website_appreciate/2012-03-25/20120325110634.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Video),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                               ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),
                                              ])
        voteViewModel = VoteViewModel(title: "今天中午吃什么?", options: ["螺蛳粉", "火锅", "麻辣烫","酸辣粉","烤肉","炒菜"], num: 27)
        topicViewModel = TopicViewModel(topics: [TopicViewModel.Item(icon: "TopicThings", text: "日常碎片"), TopicViewModel.Item(icon: "TopicChat", text: "高光时刻")])
        standViewModel = StandViewModel(items: [StandViewModel.Item(icon: "TopicThings", num: "111"), StandViewModel.Item(icon: "TopicThings", num: "222"), StandViewModel.Item(icon: "TopicThings", num: "333")])
        shareViewModel = ShareViewModel(items: [ShareViewModel.Item(icon: "ShareStand", text: "表态"), ShareViewModel.Item(icon: "SharePraise", text: "122"), ShareViewModel.Item(icon: "ShareComment", text: "86")])
    }
}
