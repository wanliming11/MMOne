//
//  DynamicTextView.swift
//  MMOne
//
//  Created by kevin wan on 2023/9/11.
//

import SwiftUI

struct DynamicTextView: View {
    var viewModel: DynamicCellViewModel.TextViewModel
    @State var isExpand: Bool = false
    let maxLines = 6

    var body: some View {
        Text(adjustContent(viewModel.content, maxLines)).lineLimit(isExpand ? nil : maxLines)
            .onTapGesture {
                isExpand.toggle()
            }
    }

    private func adjustContent(_ content: String, _ limitedShowLine: Int) -> String {
        var lines = content.components(separatedBy: .newlines)
        guard lines.count >= limitedShowLine else { return content }

        // rule1: if the last line is empty, remove it
        if lines.count == limitedShowLine, lines.last?.isEmpty == true {
            lines.removeLast()
            let newText = lines.joined(separator: "\n")
            return newText + "..."
        }

        if lines.count > limitedShowLine, lines[limitedShowLine - 1].isEmpty {
            lines[5] = "..."
        }

        return lines.joined(separator: "\n")
    }
}

@available(iOS 17.0, *)
#Preview {
    let inputText = """
    Line 1
    Line 2
    Line 3
    Line 4
    Line 5
    \n
    """
    return DynamicTextView(viewModel: DynamicCellViewModel.TextViewModel(content: inputText))
}

@available(iOS 17.0, *)
#Preview {
let inputText = """
    Line 1
    Line 2
    Line 3
    Line 4
    Line 5
    \n
    \n
    \n
    """
    return DynamicTextView(viewModel: DynamicCellViewModel.TextViewModel(content: inputText))
}
