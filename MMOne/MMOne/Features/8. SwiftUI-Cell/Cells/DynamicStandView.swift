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
                    Text(item.num)
                    Text(item.icon)
                }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicStandView(viewModel:
                        DynamicCellViewModel.StandViewModel(items: []))
}

