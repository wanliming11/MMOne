//
//  DynamicTextView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicTextView: View {
    var viewModel: DynamicCellViewModel.TextViewModel
    @State var isExpand: Bool = false
    let maxLines = 6

    var body: some View {
        Text(viewModel.content.trimmingCharacters(in: .whitespacesAndNewlines)).lineLimit(isExpand ? nil : maxLines)
            .onTapGesture {
                isExpand.toggle()
            }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicTextView(viewModel: DynamicCellViewModel.TextViewModel(content: "这是一条文本"))
}
