//
//  ContentView.swift
//  BoardHub
//
//  Created by DonHalab on 02.11.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            // Ваш интерфейс
        }
        .onAppear {
            var test = BoardModel(title: "Hello")
//            dbManager?.add(ListModel(title: "Oooo", position: 1, board: test))
//            dbManager?.add(test)
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
