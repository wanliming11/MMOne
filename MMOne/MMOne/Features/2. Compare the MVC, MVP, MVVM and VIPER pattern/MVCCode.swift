//
//  MVCCode.swift
//  MMOne
//
//  Created by kevin wan on 2023/7/16.
//  This is a example code of MVC.

import Foundation
import UIKit
import SwiftUI

// Model
class User {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// View
class UserView: UIView {
    func displayUser(name: String, age: Int) {
        print("Name: \\(name), Age: \\(age)")
    }
}

// Controller
class UserController {
    let user: User
    let userView: UserView

    init(user: User, userView: UserView) {
        self.user = user
        self.userView = userView
    }

    func updateUser(name: String, age: Int) {
        user.name = name
        user.age = age
        updateUserView()
    }

    func updateUserView() {
        userView.displayUser(name: user.name, age: user.age)
    }
}


//Mark: Inject to SwiftUI
struct MVCUIView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let user = User(name: "Kevin", age: 18)
        let userView = UserView()
        let userController = UserController(user: user, userView: userView)
        userController.updateUser(name: "Kevin", age: 18)
        return userView
    }

    func updateUIView(_ uiView: UIView, context: Context) {


    }

}
