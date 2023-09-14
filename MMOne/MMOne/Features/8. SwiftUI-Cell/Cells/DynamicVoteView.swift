//
//  DynamicVoteView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicVoteView: View {
    var viewModel: DynamicCellViewModel.VoteViewModel

    var body: some View {
        ZStack {
            Color.init(hexadecimal: "#F3F8FF")
            VStack {
                HStack {
                    Image("VoteIcon")
                        .resizable()
                        .frame(width: 64, height: 32)
                    Text(viewModel.title)
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                ForEach(viewModel.options, id:\.self) { model in
                    Button(model) {

                    }.frame(height: 36)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                }
                Text("\(viewModel.num)人参与投票")
                    .font(.system(size: 14))
                    .foregroundColor(Color.init(hexadecimal: "#999999"))
                    .padding(.top, 11)
                    .padding(.bottom, 15)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.horizontal, 15)
        }.frame(maxWidth: .infinity)
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicVoteView(viewModel: DynamicCellViewModel.VoteViewModel(title: "今天中午吃什么?", options: ["螺蛳粉", "火锅", "麻辣烫","酸辣粉","烤肉","炒菜"], num: 27))
        .padding(.horizontal, 15).frame(width: 360)
}
