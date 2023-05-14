//
//  BulletTextFieldApp.swift
//  BulletTextField
//
//  Created by Alex Potrivaev on 14/05/2023.
//

import SwiftUI

@main
struct BulletTextFieldApp: App {

    // MARK: - Public bindings

    @StateObject var viewModel = ViewModel()

    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
