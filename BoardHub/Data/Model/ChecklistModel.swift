//
//  ChecklistModel.swift
//  BoardHub
//
//  Created by DonHalab on 07.11.2024.
//

import SwiftData
import Foundation

@Model
class ChecklistModel {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    @Relationship(deleteRule: .cascade, inverse: \ChecklistItemModel.checklist) var items: [ChecklistItemModel] = []
    @Relationship var card: CardModel

    init(title: String, card: CardModel) {
        self.title = title
        self.card = card
    }
}
