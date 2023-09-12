//
//  DynamicContainerView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicContainerView: View {
    var model = DynamicCellViewModel()
    @State private var hiddenNitif = false

    var body: some View {
        VStack {
            if !hiddenNitif {
                DynamicNotifView(viewModel: model, hiddenNitif: $hiddenNitif)
            }
            DynamicHeaderView(viewModel: model.headViewModel)
            Color.red.frame(height: 3)
            DynamicTextView(viewModel: model.textViewModel)
            DynamicImagesView(viewModel: model.imageViewModel)
            DynamicVoteView(viewModel: model.voteViewModel)
            DynamicTopicView(viewModel: model.topicViewModel)
            DynamicStandView(viewModel: model.standViewModel)
            DynamicShareView(viewModel: model.shareViewModel)
        }.width(375)
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicContainerView()
}
