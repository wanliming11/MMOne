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
        HStack {
            ForEach(viewModel.topics, id: \.id) { topic in
                Text(topic.text)
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicTopicView(viewModel
                     : DynamicCellViewModel.TopicViewModel(topics: []))
}
