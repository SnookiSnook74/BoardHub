//
//  ChecklistItemModel.swift
//  BoardHub
//
//  Created by DonHalab on 07.11.2024.
//
import SwiftData
import Foundation

@Model
class ChecklistItemModel {
    @Attribute(.unique) var id: UUID = UUID()
    var text: String
    var isCompleted: Bool = false
    var position: Int
    @Relationship var checklist: ChecklistModel

    init(text: String, position: Int, checklist: ChecklistModel) {
        self.text = text
        self.position = position
        self.checklist = checklist
    }
}
