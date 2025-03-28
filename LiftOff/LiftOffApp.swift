//
//  LiftOffApp.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 28.03.25.
//

import SwiftUI

@main
struct LiftOffApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
