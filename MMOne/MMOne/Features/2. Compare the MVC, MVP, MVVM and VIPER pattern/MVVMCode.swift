//
//  MVVMCode.swift
//  MMOne
//
//  Created by kevin wan on 2023/7/22.
//

import Foundation
import SwiftUI

/// MVVM code example in swiftUI
struct CItem {
    let id: UUID
    let name: String
}

class ItemListViewModel: ObservableObject {
    @Published var items: [CItem] = []

    func fetchItems() {
        // Simulating API call or data retrieval
        let itemsData = [
            CItem(id: UUID(), name: "Item 1"),
            CItem(id: UUID(), name: "Item 2"),
            CItem(id: UUID(), name: "Item 3")
        ]
        self.items = itemsData
    }
}

struct ItemListView: View {
    @ObservedObject var viewModel: ItemListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.items, id: \.id) { item in
                Text(item.name)
            }
            .navigationTitle("Item List")
            .onAppear {
                viewModel.fetchItems()
            }
        }
    }
}

