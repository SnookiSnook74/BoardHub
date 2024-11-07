//
//  ListModel.swift
//  BoardHub
//
//  Created by DonHalab on 07.11.2024.
//
import SwiftData
import Foundation

@Model
class ListModel {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var position: Int
    @Relationship var board: BoardModel
    @Relationship(deleteRule: .cascade, inverse: \CardModel.list) var cards: [CardModel] = []

    init(title: String, position: Int, board: BoardModel) {
        self.title = title
        self.position = position
        self.board = board
    }
}
