//
//  DetailsPageVIew.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 06/12/24.
//


import SwiftUI
import CoreData

struct DetailsPageVIew: View {
   
    private var thoughtFlow:  ThoughtFlows

    var body: some View {
        
        List {
            ForEach(thoughtFlows) { thoughtFlow in
                ThoughtFlowCellUIView(thoughtFlow: thoughtFlow)
                    .onTapGesture {
                        <#code#>
                    }

            }
        }
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

    private func addItem() {
        withAnimation {
            let newItem = ThoughtFlows(context: thoughtFlow)
            newItem.timestamp = Date()
            newItem.title = "New ThoughtFlow"
            newItem.details = "some details for now"

            do {
                try thoughtFlow.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

}

#Preview {
//    DetailsPageVIew().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
