//
//  BoardHubApp.swift
//  BoardHub
//
//  Created by DonHalab on 02.11.2024.
//

import SwiftUI

@main
struct BoardHubApp: App {

    init() {
        DIContainer.shared.registerAllDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(DataContext.shared.modelContainer)
    }
}
