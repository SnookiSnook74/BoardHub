//
//  BoardModel.swift
//  BoardHub
//
//  Created by DonHalab on 07.11.2024.
//

import SwiftData
import Foundation


@Model
class BoardModel {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    @Relationship(deleteRule: .cascade, inverse: \ListModel.board) var lists: [ListModel] = []

    init(title: String) {
        self.title = title
    }
}
