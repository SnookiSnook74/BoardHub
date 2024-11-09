//
//  DataLayerAssembler.swift
//  BoardHub
//
//  Created by DonHalab on 09.11.2024.
//

import Foundation
import SwiftData


final class DataLayerAssembler {
    func registerDataLayer(in container: DIContainer, modelContainer: ModelContainer) {
        container.register(DatabaseServiceProtocol.self) {
            let context = ModelContext(modelContainer)
            return DatabaseManager(context: context)
        }
    }
}

