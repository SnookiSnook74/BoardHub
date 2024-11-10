//
//  DataContext.swift
//  BoardHub
//
//  Created by DonHalab on 09.11.2024.
//

import SwiftData

final class DataContext {
    
    static let shared = DataContext()
    
    let modelContainer: ModelContainer
    let modelContext: ModelContext
    
    private init() {
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
            self.modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Не удалось создать ModelContainer: \(error)")
        }
        self.modelContext = ModelContext(modelContainer)
    }
}
