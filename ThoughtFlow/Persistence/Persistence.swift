//
//  Persistence.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 05/12/24.
//

import CoreData

// Define a struct called PersistenceController
struct PersistenceController {
    // Create a shared instance of the PersistenceController struct
    static let shared = PersistenceController()

    // Create a preview instance of the PersistenceController struct
    @MainActor
    static let preview: PersistenceController = {
        // Create a new instance of the PersistenceController struct with inMemory set to true
        let result = PersistenceController(inMemory: true)
        // Get the view context from the container
        let viewContext = result.container.viewContext
        // Create 10 new ThoughtFlows instances and set their timestamp to the current date
        for _ in 0..<10 {
            let newItem = ThoughtFlows(context: viewContext)
            newItem.timestamp = Date()
        }
        // Save the changes to the view context
        do {
            try viewContext.save()
        } catch {
            // If an error occurs, create a new NSError and fatalError
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        // Return the result
        return result
    }()

    // Create a new NSPersistentContainer instance
    let container: NSPersistentContainer

    // Initialize the PersistenceController struct
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ThoughtFlow")
        // If inMemory is set to true, set the url of the persistent store description to /dev/null
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        // Load the persistent stores
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            // If an error occurs, create a new NSError and fatalError
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        // Set the automaticallyMergesChangesFromParent property to true
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
