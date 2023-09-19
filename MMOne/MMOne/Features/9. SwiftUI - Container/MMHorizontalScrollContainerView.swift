//
//  MMHorizontalScrollContainerView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/19.
//

import SwiftUI

struct MMHorizontalScrollContainerView: View {
    var body: some View {
        VStack {
            HStack {
                Text("我关注的鱼吧")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }.padding(.horizontal, 8)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(0 ..< 9, id: \.self) { _ in
                        MMHorizontalCellView()
                    }
                }
            }
            .maxHeight(80)
            .padding(.horizontal, 8)
        }
        .background(.yellow)
        .cornerRadius(10)
        .padding(.leading, 8)
        .padding(.trailing, 8)
    }
}

#Preview {
    MMHorizontalScrollContainerView()
}
