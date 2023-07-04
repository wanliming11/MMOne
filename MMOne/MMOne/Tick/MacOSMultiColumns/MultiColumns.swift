//
//  MultiColumns.swift
//  MVP
//
//  Created by Murloc Wan on 2023/5/8.
//

import SwiftUI

struct MultiColumns: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("click first")  /// 点击后在下一栏显示的内容
            } label: {
                Text("first")   /// 第一栏显示的内容
            }
            NavigationLink {
                Text("click second") /// 点击后在下一栏显示的内容
            } label: {
                Text("second")  /// 第二栏显示的内容
            }
            Text("three")  /// 第三栏显示的内容
        }.navigationTitle("MultiColumns")
    }
}




struct MultiColumns_Previews: PreviewProvider {
    static var previews: some View {
        MultiColumns()
    }
}
