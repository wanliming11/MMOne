//
//  HomeNormalCell.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/22.
//  通用的 Cell，一般包含主标题，副标题和图片

import SwiftUI
import Kingfisher

struct HomeNormalCell: View {
    let title: String
    let imageUrl: String
    
    var body: some View {
        VStack {
            KFImage(URL(string: imageUrl))
                        .resizable()
                        .scaledToFit()
            Text(title).font(.title).multilineTextAlignment(.leading)
        }
    }
}

struct HomeNormalCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeNormalCell(title: "111", imageUrl: "https://n.sinaimg.cn/sinakd20220729ac/320/w2048h3072/20220729/6733-35cc7d325743fbacb0bf56eeedd16c67.jpg")
    }
}
