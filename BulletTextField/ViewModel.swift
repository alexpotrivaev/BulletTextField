//
//  ViewModel.swift
//  BulletTextField
//
//  Created by Alex Potrivaev on 14/05/2023.
//

import Foundation

class ViewModel: ObservableObject {

    // MARK: - Public properties

    /// Note: I'm storing the text in CoreData as a simple string and use a listType property to capture
    /// whether it should also have bullet points (0 means it's a regular textfield, 1 means it's a bullet point,
    /// 2 means it's a numbered list. Ideally I'd prefer to keep the coredata setup simple like that vs
    /// storing an array of Strings there, but it can also be an option
    @Published var selectedItem: Item = Item(id: UUID(),
                                             text: "",
                                             listType: 0)
    @Published var bulletText: [String] = [""]
    @Published var bulletToRemove: Int = 0
    @Published var backspacePressed = false

}
