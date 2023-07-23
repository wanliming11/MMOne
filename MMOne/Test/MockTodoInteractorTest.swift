//
//  MockTodoInteractorTest.swift
//  MMOneTests
//
//  Created by kevin wan on 2023/7/22.
//

import XCTest
@testable import MMOne


class MockTodoInteractor: TodoInteractor {
    override func getTodoItems() -> [TodoItem] {
        // 使用模拟数据，模拟从数据库或网络获取的行为
        return [
            TodoItem(id: UUID(), title: "Mocked Todo 1", isCompleted: false),
            TodoItem(id: UUID(), title: "Mocked Todo 2", isCompleted: true),
        ]
    }
}

class TodoPresenterTests: XCTestCase {
    var presenter: TodoPresenter!
    var mockInteractor: MockTodoInteractor!

    override func setUp() {
        super.setUp()
        mockInteractor = MockTodoInteractor()
        presenter = TodoPresenter()
        presenter.interactor = mockInteractor
    }

    override func tearDown() {
        presenter = nil
        mockInteractor = nil
        super.tearDown()
    }

    func testFetchTodoItems() {
        presenter.fetchTodoItems()

        // 验证是否正确调用了Interactor的getTodoItems方法
        XCTAssertTrue(mockInteractor.getTodoItemsCalled)

        // 验证是否正确处理了Interactor返回的数据
        XCTAssertEqual(presenter.todoItems.count, 2)
        XCTAssertEqual(presenter.todoItems[0].title, "Mocked Todo 1")
        XCTAssertEqual(presenter.todoItems[0].isCompleted, false)
    }
}

