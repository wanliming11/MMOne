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
    let userNameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        userNameLabel.frame = frame
        self.addSubview(userNameLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayUser(name: String, age: Int) {
        print("Name: \\(name), Age: \\(age)")
        userNameLabel.text = "\(name) + \(age)"
    }
}

// Controller
class UserController {
    private let user: User
    private let userView: UserView

    init(user: User, userView: UserView) {
        self.user = user
        self.userView = userView
    }

    func updateUser(name: String, age: Int) {
        user.name = name
        user.age = age
        updateUserView()
    }

    private func updateUserView() {
        userView.displayUser(name: user.name, age: user.age)
    }
}


//MARK: Inject to SwiftUI

struct MVCUIView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let user = User(name: "Kevin", age: 18)
        let userView = UserView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let userController = UserController(user: user, userView: userView)
        userController.updateUser(name: "Kevin", age: 18)
        return userView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        
    }

}
