//
//  DIContainer.swift
//  BoardHub
//
//  Created by DonHalab on 09.11.2024.
//

import SwiftData

final class DIContainer {
    
    static let shared = DIContainer()
    
    private init() {}
    
    private var factories: [ObjectIdentifier: () -> Any] = [:]
    
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = ObjectIdentifier(type)
        factories[key] = factory
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = ObjectIdentifier(type)
        guard let factory = factories[key] else { return nil }
        return factory() as? T
    }
}

extension DIContainer {
    func registerAllDependencies(modelContainer: ModelContainer) {
        DataLayerAssembler().registerDataLayer(in: self, modelContainer: modelContainer)
    }
}

