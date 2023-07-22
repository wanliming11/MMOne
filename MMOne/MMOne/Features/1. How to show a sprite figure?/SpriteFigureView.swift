//
//  SpriteFigureView.swift
//  MMOne
//
//  Created by kevin wan on 2023/7/5.
//  

import SwiftUI
import Kingfisher

struct SpriteFigureView: View {
    @State private var contentsRect = CGRect(x: 0, y: 0, width: 0.1, height: 0.1)

    var body: some View {
        VStack {
            SprintUIView(contentsRect: $contentsRect)
                .frame(width: 100, height: 57)
                .onAppear() {
                    contentsRect = SpriteFigureParser.convertToRect(with: 56.0)
                }
        }
        .padding()
    }
}

struct SprintUIView : UIViewRepresentable {
    @Binding var contentsRect : CGRect
    let layerImage = UIImageView(frame:CGRect(x : 0,y : 0,width :0,height :0))

    func makeUIView(context : Context) -> UIView{

        let view = UIImageView(frame:CGRect(x : 0,y : 0,width :100,height :57))
        view.backgroundColor = .red

        let layer = CALayer()
        let url = URL(string: "https://img-tx-ugcimg.douyucdn2.cn/image/47257125920230227155810-upload-cfa4/vthumbimage_00001.jpg")

        layerImage.kf.setImage(with: url) { result in
            switch result {
                case .success(let value):
                    let image = value.image
                        // 将UIImage设置为UIImageView的image属性, 注意 contents 是 Any 类型，所以要给 CGImage
                    layer.contents = image.cgImage
                    layer.contentsRect = contentsRect

                case .failure(let error):
                    print("Error: \(error)")
            }
        }

        layer.frame = CGRect(x :0,y :0,width :100,height :57)

        layer.contentsRect = contentsRect

        view.layer.addSublayer(layer)

        return view
    }

    func updateUIView(_ uiView : UIView,context : Context){
        uiView.layer.sublayers?.first?.contentsRect = contentsRect
    }
}

//#Preview {
//    SpriteFigureView()
//}
