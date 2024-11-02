//
//  Item.swift
//  BoardHub
//
//  Created by DonHalab on 02.11.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
