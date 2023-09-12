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
                    Text(item.icon)
                    Text(item.text)
                }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicShareView(viewModel:  DynamicCellViewModel.ShareViewModel (items: []))
}
