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
    DynamicShareView(viewModel:  DynamicCellViewModel.ShareViewModel (items: [DynamicCellViewModel.ShareViewModel.Item(icon: "ShareStand", text: "表态"), DynamicCellViewModel.ShareViewModel.Item(icon: "SharePraise", text: "122"), DynamicCellViewModel.ShareViewModel.Item(icon: "ShareComment", text: "86")]))
}
