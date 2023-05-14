//
//  BulletListView.swift
//  BulletTextField
//
//  Created by Alex Potrivaev on 14/05/2023.
//

import SwiftUI

struct BulletListView: View {

    // MARK: - Public bindings

    @EnvironmentObject var viewModel: ViewModel

    // MARK: - Properties

    @FocusState var focusField: Int?

    // MARK: - Body

    /// Note: this is a very hacky implementation that I tried to do in pure SwiftUI that has a bunch of problems.
    /// Just adding it to demontrate some of the logic I'm looking for you to create
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.bulletText.indices, id: \.self) { index in
                HStack(alignment: .top) {
                    Text("•")
                        .foregroundColor(Color.primary)
                        .font(.system(size: 16))
                        .padding(.trailing, 8)

                    TextField("", text: $viewModel.bulletText[index], axis: .vertical)
                    .foregroundColor(Color.primary)
                    .accentColor(Color.primary)
                    .font(.system(size: 16))
                    .focused($focusField, equals: index)
                    .onChange(of: viewModel.bulletText) { [text = viewModel.bulletText] newText in
                        /// handle Return key pressed inside the body
                        if let range = newText[index].range(of: "\n"),
                           range.upperBound != newText[index].endIndex {
                            let splitStrings = newText[index].split(separator: "\n").map(String.init)
                            if splitStrings.count > 1 {
                                viewModel.bulletText[index] = splitStrings[0]
                                viewModel.bulletText.insert(splitStrings[1], at: index + 1)
                                if focusField ?? 0 < viewModel.bulletText.count - 1  {
                                    focusField = index + 1
                                } else {
                                    focusField = nil
                                }
                            }
                            return
                        /// handle Return key pressed at the end of the body
                        } else if let range = newText[index].range(of: "\n"),
                                  range.upperBound == newText[index].endIndex {
                            let splitStrings = newText[index].split(separator: "\n").map(String.init)
                            if splitStrings.count != 0 {
                                viewModel.bulletText[index] = splitStrings[0]
                            } else {
                                viewModel.bulletText[index] = ""
                            }
                            if splitStrings.count > 1 {
                                viewModel.bulletText[index] = splitStrings[0]
                                viewModel.bulletText.insert(splitStrings[1], at: index + 1)
                            } else {
                                viewModel.bulletText.insert("", at: index + 1)
                            }
                            if focusField ?? 0 < viewModel.bulletText.count - 1  {
                                focusField = index + 1
                            } else {
                                focusField = nil
                            }
                            return
                        }
                        /// handle backspace
                        if newText[index] == "" && newText[index] < text[index] {
                            if index - 1 <= newText.count - 1 {
                                DispatchQueue.main.async {
                                    focusField = index - 1
                                }
                            } else {
                                DispatchQueue.main.async {
                                    focusField = 0
                                }
                            }
                            viewModel.bulletText.remove(at: index)
                        }
                    }
                }
            }
        }
        .padding([.horizontal, .top], 20)
    }
}
