//
//  DynamicHeaderView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicHeaderView: View {
    var viewModel: DynamicCellViewModel.HeadViewModel

    var body: some View {
        Text(viewModel.content)
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicHeaderView(viewModel: DynamicCellViewModel.HeadViewModel(image: "image", name: "name", time: "time", content: "content"))
}
