//
//  DataLayerAssembler.swift
//  BoardHub
//
//  Created by DonHalab on 09.11.2024.
//

import Foundation
import SwiftData


final class DataLayerAssembler {
    func registerDataLayer(in container: DIContainer) {

        container.register(DatabaseServiceProtocol.self) {
            let contextModel = DataContext.shared.modelContext
            return DatabaseManager(context: contextModel)
        }
    }
}

