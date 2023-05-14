//
//  Item.swift
//  BulletTextField
//
//  Created by Alex Potrivaev on 14/05/2023.
//

import Foundation

struct Item: Codable, Equatable {

    // MARK: - Public properties

    var id: UUID
    var text: String
    var listType: Int
}
