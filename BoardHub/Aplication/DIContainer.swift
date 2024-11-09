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
    
    func resolve<T>(_ type: T.Type) -> T {
        let key = ObjectIdentifier(type)
        guard let factory = factories[key] else {
            fatalError("Не зарегистрирована фабрика для типа \(T.self)")
        }
        guard let instance = factory() as? T else {
            fatalError("Не удалось привести экземпляр к типу \(T.self)")
        }
        return instance
    }
}

extension DIContainer {
    enum DIContainerError: Error {
        case dependencyNotRegistered(String)
        case instanceCreationFailed(String)
    }
}

extension DIContainer {
    func registerAllDependencies() {
        DataLayerAssembler().registerDataLayer(in: self)
    }
}

