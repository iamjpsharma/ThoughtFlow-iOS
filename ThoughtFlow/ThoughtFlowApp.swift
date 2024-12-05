//
//  ThoughtFlowApp.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 05/12/24.
//

import SwiftUI

@main
struct ThoughtFlowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ThoughtFlowHomePage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
