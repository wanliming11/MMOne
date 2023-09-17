//
//  DynamicVM.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/23.
//

import Foundation
import Combine

enum BussinessType {
    case partitionType
    case homeType
}

enum RoomType {
    case liveType
    case videoType
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
    var info: [String: String] = [:]
    var currentIndex = -1
    var currentRoominfo: RoomInfo? {
        return self.currentIndex > 0 && self.currentIndex < self.rooms.count ?
            self.rooms[self.currentIndex] : nil
    }

    init(_ context: [String: String]) {
        self.info = context
    }

    // MARK: Fixed data
    /// 正向反馈数据
    func insertRecommendData(_ datas: [RoomInfo]) {
        rooms.append(contentsOf: datas)
    }

    /// 不感兴趣数据
    func filterData(by type: BussinessType) {
        rooms.removeAll { info in
            info.businessType != .partitionType
        }
    }

    /// 查询是否包含数据
    ///    - param: data 需要拼装的数据，发生在切换直播间的时候
    ///    - return: 有则索引到对应的 index，无则返回 nil
    func appendDataIfNeeded(_ data: RoomInfo) -> Int? {
        var matchIndex: Int?
        for index in 0 ..< rooms.count {
            switch rooms[index].roomType {
            case .liveType:
                if rooms[index].roomId == data.roomId {
                    matchIndex = index
                    break
                }
            case .videoType:
                if rooms[index].hashId == data.hashId {
                    matchIndex = index
                    break
                }
            }
        }

        if matchIndex == nil {
            rooms.append(data)
        }  /// 没有匹配的添加到最后一条

        return matchIndex
    }

    // MARK: Search
    func isCurrentRoom(_ roominfo: RoomInfo) -> Bool {
        guard currentIndex >= 0, currentIndex < rooms.count else { return false }

        switch roominfo.roomType {
        case .liveType:
            return roominfo.roomId == rooms[currentIndex].roomId
        case .videoType:
            return roominfo.hashId == rooms[currentIndex].hashId
        }
    }

}
