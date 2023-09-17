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
                    Text(item.text)
                }
            }
            Spacer()
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let item1 = DynamicCellViewModel.Item(icon: "TopicThings", text: "111")
    let item2 = DynamicCellViewModel.Item(icon: "TopicThings", text: "222")
    let item3 = DynamicCellViewModel.Item(icon: "TopicThings", text: "333")
    return DynamicStandView(viewModel:
                        DynamicCellViewModel.StandViewModel(items: [item1, item2, item3]))
}
