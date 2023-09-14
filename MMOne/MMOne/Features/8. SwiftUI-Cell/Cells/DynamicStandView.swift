//
//  DynamicStandView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicStandView: View {
    var viewModel: DynamicCellViewModel.StandViewModel
    var body: some View {
        HStack {
            ForEach(viewModel.items, id: \.id) { item in
                HStack {
                    Image(item.icon)
                        .resizable()
                        .frame(width: 22, height: 22)
                    Text(item.num)
                }
            }
            Spacer()
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicStandView(viewModel:
                        DynamicCellViewModel.StandViewModel(items: [DynamicCellViewModel.StandViewModel.Item(icon: "TopicThings", num: "111"), DynamicCellViewModel.StandViewModel.Item(icon: "TopicThings", num: "222"), DynamicCellViewModel.StandViewModel.Item(icon: "TopicThings", num: "333")]))
}

