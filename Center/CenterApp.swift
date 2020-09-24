//
//  CenterApp.swift
//  Center
//
//  Created by Joshua Grant on 9/24/20.
//

import SwiftUI

@main
struct CenterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
