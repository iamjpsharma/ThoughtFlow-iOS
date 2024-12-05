//
//  ContentView.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 05/12/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ThoughtFlows.timestamp, ascending: true)],
        animation: .default)
    private var thoughtFlows: FetchedResults<ThoughtFlows>

    var body: some View {
        NavigationView {
            if thoughtFlows.isEmpty{
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
                List {
                    ForEach(thoughtFlows) { thoughtFlow in
                        NavigationLink {
                            Text("Item at \(thoughtFlow.timestamp!, formatter: itemFormatter)")
                        } label: {
                            Text(thoughtFlow.timestamp!, formatter: itemFormatter)
                        }
                    }
                    .onDelete(perform: deleteItems)
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
                Text("Select an item")
            }
            
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = ThoughtFlows(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { thoughtFlows[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
