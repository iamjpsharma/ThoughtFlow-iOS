//
//  ThoughtFlowHomePage.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 05/12/24.
//

import SwiftUI
import CoreData
import SwiftUI

// Define a struct called ThoughtFlowHomePage that conforms to the View protocol
struct ThoughtFlowHomePage: View {
    // Create an environment object to access the managedObjectContext
    @Environment(\.managedObjectContext) private var viewContext
    
    // Create a FetchRequest to fetch all ThoughtFlows objects from the database, sorted by timestamp in ascending order
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ThoughtFlows.timestamp, ascending: true)],
        animation: .default
    )
    private var thoughtFlows: FetchedResults<ThoughtFlows>

    // Define the body of the view
    var body: some View {
        // Create a NavigationView
        NavigationView {
            // Check if the thoughtFlows array is empty
            if thoughtFlows.isEmpty {
                // If it is, display a VStack with an image, text, and a button to add a new ThoughtFlow
                VStack {
                    Image(systemName: "tray")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                    Text("No ThoughtFlow")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                    Button(action: addItem) {
                        Label("Add ThoughtFlow", systemImage: "plus.circle")
                            .font(.headline)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                // If the thoughtFlows array is not empty, display a List with each ThoughtFlow as a row
                List {
                    ForEach(thoughtFlows) { thoughtFlow in
                        NavigationLink(destination: DetailsPageView(thoughtFlow: thoughtFlow)) {
                            ThoughtFlowCellUIView(thoughtFlow: thoughtFlow)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                // Add a toolbar with an EditButton and a button to add a new ThoughtFlow
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        } 
    }

    // Define a function to add a new ThoughtFlow to the database
    private func addItem() {
        withAnimation {
            // Create a new ThoughtFlows object and set its properties
            let newItem = ThoughtFlows(context: viewContext)
            newItem.timestamp = Date()
            newItem.title = "New ThoughtFlow"
            newItem.details = "some details for now"

            // Save the new ThoughtFlow to the database
            do {
                try viewContext.save()
            } catch {
                // If an error occurs, display a fatal error
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    // Define a function to delete a ThoughtFlow from the database
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            // Delete each ThoughtFlow in the given offsets array
            offsets.map { thoughtFlows[$0] }.forEach(viewContext.delete)

            // Save the changes to the database
            do {
                try viewContext.save()
            } catch {
                // If an error occurs, display a fatal error
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


// Create a preview of the ThoughtFlowHomePage view
#Preview {
    ThoughtFlowHomePage()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
