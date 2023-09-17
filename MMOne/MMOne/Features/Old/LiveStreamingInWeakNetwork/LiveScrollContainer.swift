//
//  LiveScorllContainer.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/8.
//

import SwiftUI
import SwiftUIX

struct LiveScrollContainer: View {
    @State private var currentPage = 0
    @State private var isRotated = false

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                PaginationView(axis: .vertical, showsIndicators: false) {
                    ForEach(0..<10, id: \.hashValue) { index in
                        ZStack {
                            if index % 2 == 0 {
                                LiveRoomView(id: index)
                            } else {
                                TextRoomView(id: index)
                            }
                            Button {
                                if !isRotated {
                                    if #available(iOS 16, *) {
                                        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                                        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
                                    } else {
                                        let value: Double = Double(UIInterfaceOrientation.landscapeRight.rawValue )
                                        UIDevice.current.setValue(value, forKey: "orientation")
                                    }
                                } else {
                                    if #available(iOS 16, *) {
                                        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                                        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
                                    } else {
                                        let value: Double = Double(UIInterfaceOrientation.portrait.rawValue )
                                        UIDevice.current.setValue(value, forKey: "orientation")
                                    }
                                }
                                isRotated.toggle()

                            } label: {
                                Text(" Rotate ").foregroundColor(.black)
                            }
                        }
                    }
                }
            }
            .frame(height: geometry.size.height)
            .onAppear {
                LiveRoomRegister.testNotification()
            }
        }
    }
}

struct LiveScrollContainer_Previews: PreviewProvider {
    static var previews: some View {
        LiveScrollContainer()
    }
}
