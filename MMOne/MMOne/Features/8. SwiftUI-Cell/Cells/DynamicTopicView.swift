//
//  DynamicTopicView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicTopicView: View {
    var viewModel: DynamicCellViewModel.TopicViewModel

    var body: some View {
        HStack(alignment: .center) {
            ForEach(viewModel.topics, id: \.id) { topic in
                HStack {
                    Image(topic.icon)
                        .resizable()
                        .frame(width: 36, height: 36)
                    Text(topic.text)
                }.padding(.trailing, 7)
            }
            Spacer()
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicTopicView(viewModel
                     : DynamicCellViewModel.TopicViewModel(topics: [DynamicCellViewModel.TopicViewModel.Item(icon: "TopicThings", text: "日常碎片"), DynamicCellViewModel.TopicViewModel.Item(icon: "TopicChat", text: "高光时刻")]))
}
