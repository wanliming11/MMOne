//
//  LiveRoomView.swift
//  MMOne
//
//  Created by kevin wan on 2023/8/23.
//

import SwiftUI

struct LiveRainbowRoomView: View {
    @ObservedObject var vm: DynamicVM

    var body: some View {
        ForEach(vm.rooms) { room in
            if room.roomType == .LiveType {
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
    var obj = DynamicVM(["ext": "yuba"])
    obj.insertRecommendData(
        [RoomInfo(roomType: .LiveType, roomId: "1222", hashId: "", businessType: .HomeType),
         RoomInfo(roomType: .LiveType, roomId: "1223", hashId: "", businessType: .HomeType),
         RoomInfo(roomType: .VideoType, roomId: "1222", hashId: "122222", businessType: .HomeType)])
    LiveRainbowRoomView(vm: obj)
}
