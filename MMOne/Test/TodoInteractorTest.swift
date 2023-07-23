//
//  TodoInteractorTests.swift
//  MMOneTests
//
//  Created by kevin wan on 2023/7/22.
//

import XCTest
@testable import MMOne


final class TodoInteractorTests: XCTestCase {
    var interactor: TodoInteractor!

    override func setUp() {
        super.setUp()
        interactor = TodoInteractor()
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }

    func testGetTodoItems() {
        let todoItems = interactor.getTodoItems()

        // 验证是否正确获取待办事项数据
        XCTAssertNotNil(todoItems)
        XCTAssertEqual(todoItems.count, 3)

        // 验证待办事项数据的内容
        XCTAssertEqual(todoItems[0].title, "Buy groceries")
        XCTAssertEqual(todoItems[0].isCompleted, false)
    }

}
