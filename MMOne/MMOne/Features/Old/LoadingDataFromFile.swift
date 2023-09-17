//
//  LoadingDataFromFile.swift
//  MVP
//
//  Created by Murloc Wan on 2023/5/8.
//

import Foundation

enum Features {
    func loadingDataFromFile(_ file: String) -> Data? {
        /// 1. 根据文件名从本地 bundle 中读取文件的 url
        /// 2. 使用 Data(contentOf) 的方式读取出裸数据
        /// 3. 返回数据
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
            return nil
        }
    }
}
