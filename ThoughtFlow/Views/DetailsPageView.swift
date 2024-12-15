//
//  DetailsPageView.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 06/12/24.
//


import SwiftUI
import CoreData

struct DetailsPageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode  // This is for dismissing the view
    
    @ObservedObject private var thoughtFlow: ThoughtFlows
    
    @State private var title: String
    @State private var details: String

    init(thoughtFlow: ThoughtFlows) {
        self.thoughtFlow = thoughtFlow
        _title = State(initialValue: thoughtFlow.title ?? "")
        _details = State(initialValue: thoughtFlow.details ?? "")
    }

    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter title", text: $title, onCommit: saveChanges)
                .font(.largeTitle)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)

            TextEditor(text: $details)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .frame(maxHeight: .infinity)

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    saveChanges()
                }
            }
        }
    }

    private func saveChanges() {
        thoughtFlow.title = title
        thoughtFlow.details = details
        thoughtFlow.timestamp = Date()  // Update timestamp to reflect the current time

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        // Dismiss the view after saving
        presentationMode.wrappedValue.dismiss()
    }
}





#Preview {
    DetailsPageView(thoughtFlow: mockThoughtFlow())
}

// Helper function to create a mock ThoughtFlows object
@MainActor func mockThoughtFlow() -> ThoughtFlows {
    let context = PersistenceController.preview.container.viewContext
    let newItem = ThoughtFlows(context: context)
    newItem.timestamp = Date()
    newItem.title = "New ThoughtFlow"
    newItem.details = "Some details for now"
    return newItem
}
