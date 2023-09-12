//
//  DynamicImagesView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI
import Kingfisher

struct DynamicImagesView: View {
    var viewModel: DynamicCellViewModel.ImageViewModel

    var body: some View {
        HStack {
            ForEach(viewModel.imgs, id: \.self) { img in
                KFImage(URL(string: img))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicImagesView(viewModel: DynamicCellViewModel.ImageViewModel(imgs: ["image1", "image2", "image3"]))
}
