//
//  DynamicNotifView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicNotifView: View {
    var viewModel: DynamicCellViewModel
    @Binding var hiddenNitif: Bool

    var body: some View {
        HStack {
            Text("\(viewModel.notifViewModel.content)")
            Button("❌") {
                hiddenNitif.toggle()
            }
        }
    }
}
