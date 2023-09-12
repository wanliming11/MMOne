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
        VStack {
            Text(viewModel.title)
            HStack {
                ForEach(0 ..< viewModel.options.count) { index in
                    Button(viewModel.options[index]) {

                    }
                }
            }
        }.background(Color.red)
        Color.yellow
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicVoteView(viewModel: DynamicCellViewModel.VoteViewModel(title: "这是一条投票", options: ["选项1", "选项2", "选项3"]))
}
