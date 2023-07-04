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
        HomeBannerCell(images: ["https://n.sinaimg.cn/sinakd20220729ac/320/w2048h3072/20220729/6733-35cc7d325743fbacb0bf56eeedd16c67.jpg","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F01%2F20200401092826_osrpf.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1684749733&t=9b5128800b679c4503d76f27940db1c3", "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202002%2F19%2F20200219141947_cmsjs.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1684749733&t=68c22f831aa6f7328545cf2196c06426"])
    }
}
