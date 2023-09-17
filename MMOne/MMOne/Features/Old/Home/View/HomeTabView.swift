//
//  HomeTabView.swift
//  MVP
//
//  Created by Murloc Wan on 2023/4/18.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            HomeCellView()
                   .tabItem {
                       Label("Home", systemImage: "circle.fill")
                   }
            HomeCellView()
                   .tabItem {
                       Label("Attention", systemImage: "circle.fill")
                   }
            HomeCellView()
                   .tabItem {
                       Label("Personal Center", systemImage: "circle.fill")
                   }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
