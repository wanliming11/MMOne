//
//  DynamicVM.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/23.
//

import Foundation
import Combine

enum BussinessType {
    case PartitionType
    case HomeType
}

enum RoomType {
    case LiveType
    case VideoType
}

struct RoomInfo: Identifiable {
    var id = UUID()
    var roomType: RoomType
    var roomId: String
    var hashId: String
    var businessType: BussinessType
}


class DynamicVM: ObservableObject {
    @Published var rooms: [RoomInfo] = []
    var info: Dictionary<String, String> = [:]
    var currentIndex = -1
    var currentRoominfo: RoomInfo? {
        return self.currentIndex > 0 && self.currentIndex < self.rooms.count ?
            self.rooms[self.currentIndex] : nil
    }

    init(_ context: Dictionary<String, String>) {
        self.info = context
    }

    //MARK: Fixed data
    /// 正向反馈数据
    func insertRecommendData(_ datas: [RoomInfo]) {
        rooms.append(contentsOf: datas)
    }

    /// 不感兴趣数据
    func filterData(by type: BussinessType) {
        rooms.removeAll { info in
            info.businessType != .PartitionType
        }
    }

    /// 查询是否包含数据
    ///    - param: data 需要拼装的数据，发生在切换直播间的时候
    ///    - return: 有则索引到对应的 index，无则返回 nil
    func appendDataIfNeeded(_ data: RoomInfo) -> Int? {
        var index: Int? = nil
        for i in 0 ..< rooms.count {
            switch rooms[i].roomType {
            case .LiveType:
                if rooms[i].roomId == data.roomId {
                    index = i
                    break
                }
            case .VideoType:
                if rooms[i].hashId == data.hashId {
                    index = i
                    break
                }
            }
        }

        if index == nil  {
            rooms.append(data)
        }  /// 没有匹配的添加到最后一条

        return index
    }

    //MARK: Search
    func isCurrentRoom(_ roominfo: RoomInfo) -> Bool {
        guard currentIndex >= 0, currentIndex < rooms.count else { return false }

        switch roominfo.roomType {
        case .LiveType:
            return roominfo.roomId == rooms[currentIndex].roomId
        case .VideoType:
            return roominfo.hashId == rooms[currentIndex].hashId
        }
    }

}
