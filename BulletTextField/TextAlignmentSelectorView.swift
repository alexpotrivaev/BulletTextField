//
//  TextAlignmentSelectorView.swift
//  BulletTextField
//
//  Created by Alex Potrivaev on 14/05/2023.
//

import SwiftUI

struct TextAlignmentSelectorView: View {

    // MARK: - Public bindings

    @EnvironmentObject var viewModel: ViewModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<3) { index in
                Button(action: {
                    if index != 0 {
                        viewModel.bulletText = viewModel.selectedItem.text.split(separator: "\n").map(String.init)
                    }
                    viewModel.selectedItem.listType = index
                }) {
                    Image(systemName: text(for: index))
                        .foregroundColor(textColor(for: index))
                        .font(.system(size: 16))
                        .frame(width: 36, height: 32)
                        .background(backgroundColor(for: index))
                        .cornerRadius(11)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 14)
    }

    // MARK: - Private methods

    private func text(for index: Int) -> String {
        if index == 0 {
            return "text.justify.left"
        } else if index == 1 {
            return "list.bullet"
        } else {
            return "list.number"
        }
    }

    private func textColor(for index: Int) -> Color {
        if viewModel.selectedItem.listType == index {
            return Color.primary
        } else {
            return Color.secondary
        }
    }

    private func backgroundColor(for index: Int) -> Color {
        if viewModel.selectedItem.listType == index {
            return Color.primary.opacity(0.06)
        } else {
            return Color.clear
        }
    }
}
