//
//  ContentView.swift
//  BoardHub
//
//  Created by DonHalab on 02.11.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Query private var board: [BoardModel]
    var dbManager: DatabaseServiceProtocol = DIContainer.shared.resolve(DatabaseServiceProtocol.self)

    var body: some View {
        VStack {
            List(board) { item in
                Text(item.title)
            }
            
            Button("Добавить тестовые данные") {
                let test = BoardModel(title: "Hello \(Int.random(in: 0...10))")
                let list = ListModel(title: "Oooo", position: 1, board: test)
                dbManager.add(list)
                dbManager.add(test)
            }
            .padding()
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
