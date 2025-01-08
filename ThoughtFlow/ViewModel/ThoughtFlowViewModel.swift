//
//  ThoughtFlowViewModel.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 15/12/24.
//

import SwiftUI
import CoreData

class ThoughtFlowViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    @Published var thoughtFlows: [ThoughtFlows] = []
    private var context: NSManagedObjectContext
    private var fetchedResultsController: NSFetchedResultsController<ThoughtFlows>?

    // Initialize the ThoughtFlowController with a context
    init(context: NSManagedObjectContext) {
        self.context = context
        super.init() // Call the superclass initializer
        setupFetchedResultsController()
        fetchThoughtFlows()
    }

    // Set up the fetchedResultsController
    private func setupFetchedResultsController() {
        // Create a fetch request for the ThoughtFlows entity
        let fetchRequest: NSFetchRequest<ThoughtFlows> = ThoughtFlows.fetchRequest()
        // Sort the fetch request by the timestamp in ascending order
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \ThoughtFlows.timestamp, ascending: true)]
        
        // Create the fetchedResultsController with the fetch request, managedObjectContext, sectionNameKeyPath, and cacheName
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        // Set the fetchedResultsController delegate to self
        fetchedResultsController?.delegate = self
    }

    func fetchThoughtFlows() {
        // Fetch the ThoughtFlows from the Core Data context
        do {
            try fetchedResultsController?.performFetch()
            // Assign the fetched objects to the thoughtFlows array
            thoughtFlows = fetchedResultsController?.fetchedObjects ?? []
        } catch {
            // Print an error message if the fetch fails
            print("Failed to fetch ThoughtFlows: \(error)")
        }
    }
    
    func addItem() {
        // Create a new ThoughtFlow object and set its properties
        let newItem = ThoughtFlows(context: context)
        newItem.timestamp = Date()
        newItem.title = "New ThoughtFlow"
        newItem.details = "some details for now"
        
        // Save the context
        saveContext()
    }
    
    func deleteItems(at offsets: IndexSet) {
        // Delete the selected ThoughtFlow objects from the context
        offsets.map { thoughtFlows[$0] }.forEach(context.delete)
        // Save the context
        saveContext()
    }
    
    // Save the context and refresh the thoughtFlows array
    private func saveContext() {
        do {
            try context.save()
            fetchThoughtFlows() // Refresh after saving
        } catch {
            // Print an error message if the save fails
            print("Failed to save context: \(error)")
        }
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    // Refresh the thoughtFlows array when the content changes
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchThoughtFlows()
    }
}
