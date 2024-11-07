//
//  AttachmentModel.swift
//  BoardHub
//
//  Created by DonHalab on 07.11.2024.
//

import SwiftData
import Foundation

@Model
class AttachmentModel {
    @Attribute(.unique) var id: UUID = UUID()
    var fileName: String
    var fileData: Data
    var uploadedDate: Date = Date()
    @Relationship var card: CardModel

    init(fileName: String, fileData: Data, card: CardModel) {
        self.fileName = fileName
        self.fileData = fileData
        self.card = card
    }
}
