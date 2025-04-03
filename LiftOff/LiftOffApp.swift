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
    
    init() {
        if #available(iOS 13.0, *) {
            UIView.appearance().overrideUserInterfaceStyle = .dark
        }
    }

    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: HomeViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
