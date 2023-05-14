//
//  ContentView.swift
//  BulletTextField
//
//  Created by Alex Potrivaev on 14/05/2023.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Public bindings

    @EnvironmentObject var viewModel: ViewModel

    // MARK: - Properties

    @FocusState var focusField: Int?

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            if viewModel.selectedItem.listType != 0 {
                BulletListView()
            } else {
                TextField("Placeholder",
                          text: $viewModel.selectedItem.text.max(600),
                          axis: .vertical)
                .font(.system(size: 16))
                .foregroundColor(Color.primary)
                .padding([.horizontal, .top], 20)
                .accentColor(Color.primary)
                .focused($focusField, equals: 0)
            }
            TextAlignmentSelectorView()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.primary.opacity(0.06), lineWidth: 1.6)
        )
        .padding(.horizontal, 20)

    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}
