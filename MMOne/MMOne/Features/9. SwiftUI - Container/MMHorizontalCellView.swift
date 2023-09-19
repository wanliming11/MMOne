//
//  MMHorizontalCellView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/19.
//

import SwiftUI
import Kingfisher

struct MMHorizontalCellView: View {
    var body: some View {
        VStack {
            KFImage(URL(string: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg"))
                .resizable()
                .frame(width: 56, height: 56)
                .cornerRadius(10)
            Text("王者荣耀")
                .font(.system(size: 13))
        }

    }
}

#Preview {
    MMHorizontalCellView()
}
