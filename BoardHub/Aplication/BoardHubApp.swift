//
//  BoardHubApp.swift
//  BoardHub
//
//  Created by DonHalab on 02.11.2024.
//

import SwiftUI
import SwiftData

@main
struct BoardHubApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            BoardModel.self,
            ListModel.self,
            CardModel.self,
            AttachmentModel.self,
            ChecklistModel.self,
            ChecklistItemModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        DIContainer.shared.registerAllDependencies(modelContainer: sharedModelContainer)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(sharedModelContainer)
    }
}
