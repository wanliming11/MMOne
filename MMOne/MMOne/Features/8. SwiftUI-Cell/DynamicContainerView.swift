//
//  DynamicContainerView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicContainerView: View {
    @StateObject var model = DynamicCellViewModel()

    private func gridLayout() -> [GridItem] {
        return [
            GridItem(.flexible())
        ]

    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout(), alignment: .leading, spacing: 30)  {
                ForEach(0 ..< 9, id: \.self) { _ in
                    ExtractedView(model: model)
                }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicContainerView()
}

struct ExtractedView: View {
    @State private var hiddenNitif = false
    var model: DynamicCellViewModel

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
        }
    }
}
