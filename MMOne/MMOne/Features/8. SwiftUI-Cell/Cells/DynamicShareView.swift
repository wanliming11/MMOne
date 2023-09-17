//
//  DynamicShareView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicShareView: View {
    var viewModel: DynamicCellViewModel.ShareViewModel
    var body: some View {
        HStack {
            ForEach(viewModel.items, id: \.id) { item in
                HStack {
                    Spacer()
                    Image(item.icon)
                        .resizable()
                        .frame(width: 44, height: 44)
                    Text(item.text)
                    Spacer()
                }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let item1 = DynamicCellViewModel.Item(icon: "ShareStand", text: "表态")
    let item2 = DynamicCellViewModel.Item(icon: "SharePraise", text: "122")
    let item3 = DynamicCellViewModel.Item(icon: "ShareComment", text: "86")
    return DynamicShareView(viewModel: DynamicCellViewModel.ShareViewModel (items: [item1, item2, item3 ]))
}
