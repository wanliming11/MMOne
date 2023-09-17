//
//  LiveRoomView.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/23.
//

import SwiftUI

struct LiveRainbowRoomView: View {
    @ObservedObject var roomViewModel: DynamicVM

    var body: some View {
        ForEach(roomViewModel.rooms) { room in
            if room.roomType == .liveType {
                LiveRainRoomView(room: room)
            } else {
                VideoRoomView(room: room)
            }
        }
    }
}

struct LiveRainRoomView: View {
    var room: RoomInfo

    var body: some View {
        Text("LiveRoomView")
    }
}

struct VideoRoomView: View {
    var room: RoomInfo

    var body: some View {
        Text("VideoRoomView")
    }
}

@available(iOS 17.0, *)
#Preview {
    let obj = DynamicVM(["ext": "yuba"])
    obj.insertRecommendData(
        [RoomInfo(roomType: .liveType, roomId: "1222", hashId: "", businessType: .homeType),
         RoomInfo(roomType: .liveType, roomId: "1223", hashId: "", businessType: .homeType),
         RoomInfo(roomType: .videoType, roomId: "1222", hashId: "122222", businessType: .homeType)])
    return LiveRainbowRoomView(roomViewModel: obj)
}
