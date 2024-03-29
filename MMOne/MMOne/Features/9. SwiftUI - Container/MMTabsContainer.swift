//
//  MMTabsContainer.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/19.
//

import SwiftUI

struct MMTabsContainer1: View {
    @State private var selectedSegment = 0
    let segments = ["Segment 1", "Segment 2", "Segment 3"]

    var body: some View {
        VStack {
            Picker("", selection: $selectedSegment) {
                ForEach(0 ..< segments.count, id: \.self) { index in
                    Text(self.segments[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            TabView(selection: $selectedSegment) {
                VStack {
                    MMHorizontalScrollContainerView()
                    DynamicContainerView()
                }.tag(0)
                Text("Content for Segment 2")
                    .tag(1)
                Text("Content for Segment 3")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct MMTabsContainer: View {
    var body: some View {
        TabView {
            #if DEBUG
            VStack {
                MMHorizontalScrollContainerView()
                DynamicContainerView()
            }.tabItem {
                Image(systemName: "message.fill")
                Text("关注")
            }

            Text("鱼吧")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("鱼吧")
                }
            #else
            
            #endif
        }
    }
}

#Preview {
    MMTabsContainer1()
}
