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

    init(context: NSManagedObjectContext) {
        self.context = context
        super.init() // Call the superclass initializer
        setupFetchedResultsController()
        fetchThoughtFlows()
    }

    private func setupFetchedResultsController() {
        let fetchRequest: NSFetchRequest<ThoughtFlows> = ThoughtFlows.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \ThoughtFlows.timestamp, ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchedResultsController?.delegate = self // Assign self as the delegate
    }

    func fetchThoughtFlows() {
        do {
            try fetchedResultsController?.performFetch()
            thoughtFlows = fetchedResultsController?.fetchedObjects ?? []
        } catch {
            print("Failed to fetch ThoughtFlows: \(error)")
        }
    }

    func addItem() {
        let newItem = ThoughtFlows(context: context)
        newItem.timestamp = Date()
        newItem.title = "New ThoughtFlow"
        newItem.details = "some details for now"

        saveContext()
    }

    func deleteItems(at offsets: IndexSet) {
        offsets.map { thoughtFlows[$0] }.forEach(context.delete)
        saveContext()
    }

    private func saveContext() {
        do {
            try context.save()
            fetchThoughtFlows() // Refresh after saving
        } catch {
            print("Failed to save context: \(error)")
        }
    }

    // MARK: - NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        thoughtFlows = fetchedResultsController?.fetchedObjects ?? []
    }
}
