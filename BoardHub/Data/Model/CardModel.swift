//
//  CardModel.swift
//  BoardHub
//
//  Created by DonHalab on 07.11.2024.
//
import SwiftData
import Foundation

@Model
class CardModel {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var descriptionName: String?
    var position: Int
    var dueDate: Date?
    @Relationship var list: ListModel
    @Relationship(deleteRule: .cascade, inverse: \AttachmentModel.card) var attachments: [AttachmentModel] = []
    @Relationship(deleteRule: .cascade, inverse: \ChecklistModel.card) var checklists: [ChecklistModel] = []

    init(title: String, description: String?, position: Int, dueDate: Date?, list: ListModel) {
        self.title = title
        self.descriptionName = description
        self.position = position
        self.dueDate = dueDate
        self.list = list
    }
}
