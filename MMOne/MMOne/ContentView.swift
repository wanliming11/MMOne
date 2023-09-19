//
//  ContentView.swift
//  BaseDesignPattern
//
//  Created by Murloc Wan on 2023/2/26.
//

import SwiftUI

struct ContentView: View {
    var listViewModel = ItemListViewModel()
    var obj = DynamicVM(["ext": "yuba"])

    var body: some View {
//        ScrollView {
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//                SpriteFigureView()
//                MVCUIView().frame(width: 100, height: 50)
//                LiveRainbowRoomView(roomViewModel: obj)
//                ItemListView(viewModel: listViewModel)
//                    .onAppear {
                        // 1. test associatedtype
    //                    let person = Person()
    //                    person.printGroup()
                        // 2. test read&write lock
    //                    let lock = ReadAndWriteLock()
    //                    DispatchQueue.concurrentPerform(iterations: 50) { _ in
    //                        lock.setValue(42)
    //                        NSLog("\(lock.getValue())")
    //                    }
                        // 3. test atomic property
    //                    let atomicLock = AtomicPropertyLock()
    //                    DispatchQueue.concurrentPerform(iterations: 10) { i  in
    //                        atomicLock.setValue(i)
    //                        NSLog("\(atomicLock.getValue())")
    //                    }

                        // 4. Dead lock
    //                    let serialQueue = DispatchQueue(label: "com.example.serial")
    //
    //                    serialQueue.async {
    //                        print("Task 1: Waiting for Task 2 to finish")
    //                        serialQueue.sync {
    //                            print("Task 1: Task 2 finished, but I'm waiting!")
    //                        }
    //                    }
    //
    //                    print("skip")
                        // 5. upate data
    //                    obj.insertRecommendData(
    //                        [RoomInfo(roomType: .LiveType, roomId: "1222", hashId: "", businessType: .HomeType),
    //                         RoomInfo(roomType: .LiveType, roomId: "1223", hashId: "", businessType: .HomeType),
    //                         RoomInfo(roomType: .VideoType, roomId: "1222", hashId: "122", businessType: .HomeType)])
    //
    //                    let delayTime = DispatchTime.now() + 2.0 // 延迟 2 秒
    //                    DispatchQueue.main.asyncAfter(deadline: delayTime) {
    //                    obj.insertRecommendData(
    //                            [RoomInfo(roomType: .VideoType, roomId: "aaabb", hashId: "", businessType: .HomeType),
    //                             RoomInfo(roomType: .LiveType, roomId: "1223", hashId: "", businessType: .HomeType),
    //                             RoomInfo(roomType: .VideoType, roomId: "22", hashId: "22", businessType: .HomeType)])
    //                    }
//                    }
//                DynamicContainerView()
//                TodoView(presenter: TodoPresenter())
//            }
//            .padding()
//        }
        MMTabsContainer1()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
