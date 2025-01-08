//
//  ThoughtFlowApp.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 05/12/24.
//

import SwiftUI

@main
struct ThoughtFlowApp: App {
    // Create an instance of the PersistenceController
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //            ThoughtFlowHomePage(context: persistenceController.container.viewContext)
            // Create an instance of the ThoughtFlowHomePage and pass the managedObjectContext to it
            ThoughtFlowHomePage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

