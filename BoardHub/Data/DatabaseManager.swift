//
//  DatabaseManager.swift
//  BoardHub
//
//  Created by DonHalab on 09.11.2024.
//


import SwiftData
import SwiftUI

// MARK: - Протокол для управления базой данных
/// Протокол, определяющий базовые операции управления базой данных для моделей, соответствующих `PersistentModel`.
protocol DatabaseServiceProtocol {
    /// Добавляет новую модель в базу данных.
    func add<T: PersistentModel>(_ model: T)
    
    /// Извлекает все объекты указанного типа из базы данных.
    func fetchAll<T: PersistentModel>(_ modelType: T.Type) -> [T]
    
    /// Обновляет существующую модель в базе данных.
    func update<T: PersistentModel>(_ model: T, updateBlock: (T) -> Bool)
    
    /// Удаляет указанную модель из базы данных.
    func delete<T: PersistentModel>(_ model: T)

    /// Удаляет все объекты указанных типов из базы данных.
    func deleteAll<T: PersistentModel>(_ modelTypes: [T.Type])
}

// MARK: - DatabaseServiceProtocol реализация
class DatabaseManager: DatabaseServiceProtocol {
    
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func add<T: PersistentModel>(_ model: T) {
        context.insert(model)
        saveChanges()
    }
    
    func fetchAll<T: PersistentModel>(_ modelType: T.Type)  -> [T] {
        let descriptor = FetchDescriptor<T>()
        do {
            return try context.fetch(descriptor)
        } catch {
            print("Ошибка при получении данных для \(T.self): \(error)")
            return []
        }
    }
    
    func update<T: PersistentModel>(_ model: T, updateBlock: (T) -> Bool) {
        let hasChanges = updateBlock(model)
        if hasChanges {
          saveChanges()
        }
    }
    
    func delete<T: PersistentModel>(_ model: T) {
        context.delete(model)
        saveChanges()
    }
    
    func deleteAll<T: PersistentModel>(_ modelTypes: [T.Type]) {
        try? modelTypes.forEach { modelType in
            let descriptor = FetchDescriptor<T>()
            let objects = try context.fetch(descriptor)
            objects.forEach { context.delete($0) }
        }
        saveChanges()
    }
    
    func batchInsert<T: PersistentModel>(_ models: [T]) {
        models.forEach { context.insert($0) }
        saveChanges()
    }
    
    func saveChanges() {
        do {
            try context.save()
        } catch {
            print("Ошибка сохранения изменений: \(error)")
        }
    }
}
