//
//  DetailsPageView.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 06/12/24.
//


import SwiftUI
import CoreData

struct DetailsPageView: View {
    
    private var thoughtFlow:  ThoughtFlows
    @Environment(\.managedObjectContext) private var viewContext
    
    init(thoughtFlow: ThoughtFlows) {
        self.thoughtFlow = thoughtFlow
    }
    
    var body: some View {
        
        LazyVStack {
            Text("Details Page")
                .font(.headline)
            Text("title: \(thoughtFlow.title ?? "untitled")")
            Text("Details: \(thoughtFlow.details ?? "no thoughts")")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = ThoughtFlows(context: viewContext)
            newItem.timestamp = Date()
            newItem.title = "New ThoughtFlow"
            newItem.details = "some details for now"
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}

#Preview {
    DetailsPageView(thoughtFlow: mockThoughtFlow())
}

// Helper function to create a mock ThoughtFlows object
func mockThoughtFlow() -> ThoughtFlows {
    let context = PersistenceController.preview.container.viewContext
    let newItem = ThoughtFlows(context: context)
    newItem.timestamp = Date()
    newItem.title = "New ThoughtFlow"
    newItem.details = "Some details for now"
    return newItem
}

