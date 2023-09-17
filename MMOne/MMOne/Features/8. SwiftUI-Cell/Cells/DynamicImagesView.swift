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
        LazyVGrid(columns: gridLayout(), alignment: .leading, spacing: 4.5) {
        ForEach(0 ..< (viewModel.imgs.count >= maxCounter ? maxCounter : viewModel.imgs.count), id: \.self) { index in
                ZStack {
                    KFImage(URL(string: viewModel.imgs[index].url))
                        .resizable()
                    if viewModel.imgs[index].type == .video {
                        Image("VideoPlay")
                            .frame(width: 36, height: 36)
                    }
                    if viewModel.imgs.count > maxCounter {
                        if index == maxCounter - 1 {
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
DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                   type: .image),
DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                               type: .image)])).padding(.horizontal, 15)
}

#Preview {
    DynamicImagesView(viewModel: DynamicCellViewModel.ImageViewModel(imgs: [
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .video)])).padding(.horizontal, 15)
}

#Preview {
    DynamicImagesView(viewModel: DynamicCellViewModel.ImageViewModel(imgs: [
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image),
        DynamicCellViewModel.ImageItem(url: "https://cdn.birdseye.photo/media/resized/large/004138-914-id3320.jpg",
                                       type: .image)])).padding(.horizontal, 15)
}
