//
//  VIPERCode.swift
//  MMOne
//
//  Created by kevin wan on 2023/7/22.
//

import Foundation
import SwiftUI

struct TodoItem {
    let id: UUID
    let title: String
    let isCompleted: Bool
}

class TodoInteractor {
    func getTodoItems() -> [TodoItem] {
        // 在实际应用中，这里可能是从数据库或网络获取数据
        return [
            TodoItem(id: UUID(), title: "Buy groceries", isCompleted: false),
            TodoItem(id: UUID(), title: "Finish report", isCompleted: false),
            TodoItem(id: UUID(), title: "Exercise", isCompleted: true)
        ]
    }
}

class TodoPresenter: ObservableObject {
    private let interactor = TodoInteractor()

    @Published var todoItems: [TodoItem] = []

    func fetchTodoItems() {
        todoItems = interactor.getTodoItems()
    }
}

struct TodoView: View {
    @ObservedObject var presenter = TodoPresenter()

    var body: some View {
        List(presenter.todoItems, id: \.id) { item in
            Text(item.title)
        }
        .onAppear {
            presenter.fetchTodoItems()
        }
    }
}
