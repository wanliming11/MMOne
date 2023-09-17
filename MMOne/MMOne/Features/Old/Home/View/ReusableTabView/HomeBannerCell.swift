//
//  HomeBannerCell.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/22.
//  轮播视图 Cell

import SwiftUI
import Kingfisher
import SwiftUIX

struct HomeBannerCell: View {
    let images: [String]
    @State var currentIndex = 0

    var body: some View {
        PaginationView(axis: .horizontal) {
            ForEach(images, id: \.self) { url in
                KFImage(URL(string: url ))
                            .resizable()
                            .scaledToFit()
            }
        }
        .currentPageIndex($currentIndex)
        .pageIndicatorTintColor(.red)
        .currentPageIndicatorTintColor(.blue)
    }
}

struct HomeBannerCell_Previews: PreviewProvider {
    static var previews: some View {
    let imageUrl1 = "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg"
    let imageUrl2 = "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg"
    let imageUrl3 = "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg"
        HomeBannerCell(images:
                        [imageUrl1, imageUrl2, imageUrl3
                        ]
        )
    }
}
