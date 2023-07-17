//
//  ContentView.swift
//  BaseDesignPattern
//
//  Created by Murloc Wan on 2023/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            SpriteFigureView()
            MVCUIView().frame(width: 100, height: 50)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
