//
//  MarkdownMadnessApp.swift
//  MarkdownMadness
//
//  Created by Config Actor on 6/16/24.
//

import SwiftUI

@main
struct MarkdownMadnessApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
