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
    let maxCounter = 9

    var body: some View {
        LazyVGrid(columns: gridLayout(), alignment: .leading, spacing: 4.5)  {
            ForEach(0 ..< (viewModel.imgs.count >= maxCounter ? maxCounter : viewModel.imgs.count), id: \.self) { i in
                ZStack {
                    KFImage(URL(string: viewModel.imgs[i].url))
                        .resizable()
                    if viewModel.imgs[i].type == .Video {
                        Image("VideoPlay")
                            .frame(width: 36, height: 36)
                    }
                    if viewModel.imgs.count > maxCounter {
                        if i == maxCounter - 1 {
                            ZStack {
                                Color.black.opacity(0.5)
                                Text("+\(viewModel.imgs.count - maxCounter)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(10)
            }
        }
    }

    private func gridLayout() -> [GridItem] {
        let itemCount = viewModel.imgs.count
        switch itemCount {
        case 1 ... 3:
            return (0 ..< itemCount).map { _ in
                GridItem(.flexible())
            }
        case 4:
            return [GridItem(.fixed(150)), GridItem(.fixed(150))]
        default:
            return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DynamicImagesView(viewModel: DynamicCellViewModel.ImageViewModel(imgs: [
        DynamicCellViewModel.ImageViewModel.ImageItem(url: "https://img0.baidu.com/it/u=1910540168,2901566440&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=332", type: .Image),
        DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),])).padding(.horizontal, 15)
}

#Preview {
    DynamicImagesView(viewModel: DynamicCellViewModel.ImageViewModel(imgs: [
        DynamicCellViewModel.ImageViewModel.ImageItem(url: "https://img0.baidu.com/it/u=1910540168,2901566440&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=332", type: .Image),
        DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Video)])).padding(.horizontal, 15)
}

#Preview {
    DynamicImagesView(viewModel: DynamicCellViewModel.ImageViewModel(imgs: [
        DynamicCellViewModel.ImageViewModel.ImageItem(url: "https://img0.baidu.com/it/u=1910540168,2901566440&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=332", type: .Image),
        DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image),DynamicCellViewModel.ImageViewModel.ImageItem(url:  "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg", type: .Image)])).padding(.horizontal, 15)
}
