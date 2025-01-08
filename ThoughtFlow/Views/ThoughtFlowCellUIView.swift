//
//  ThoughtFlowCellUIView.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 06/12/24.
//

import SwiftUI

// Define a struct for the ThoughtFlowCellUIView
struct ThoughtFlowCellUIView: View {
    
    // Declare a variable for the ThoughtFlows object
    var thoughtFlow: ThoughtFlows
    
    // Define the body of the view
    var body: some View {
        // Create a VStack with alignment leading and spacing of 10
        VStack(alignment: .leading, spacing: 10) {
            // Create a Text object with the title of the ThoughtFlows object
            Text("\(String(describing: thoughtFlow.title ?? "Empty Title"))")
                .font(.headline)
                .foregroundColor(.primary)

            // Create a Text object with the details of the ThoughtFlows object
            Text("\(String(describing: thoughtFlow.details ?? ""))")
                .font(.body)
                .foregroundColor(.secondary)

            // Create a HStack with a Spacer and a Text object with the timestamp of the ThoughtFlows object
            HStack {
                Spacer()
                if let timestamp = thoughtFlow.timestamp {
                    Text("\(DateFormatterUtils.relativeDateString(from: timestamp))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
        // Add a corner radius and shadow to the VStack
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}

// Define a struct for the ThoughtFlowCellUIView previews
struct ThoughtFlowCellUIView_Previews: PreviewProvider {
    // Define the previews
    static var previews: some View {
        // Creating a mock ThoughtFlows object for the preview
        let mockThoughtFlow = ThoughtFlows(context: PersistenceController.preview.container.viewContext)
        mockThoughtFlow.timestamp = Date() // Set a mock timestamp
        mockThoughtFlow.details = "moked details"
        mockThoughtFlow.title = "title"
        // Return the ThoughtFlowCellUIView with the mock ThoughtFlows object
        return ThoughtFlowCellUIView(thoughtFlow: mockThoughtFlow)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.1)) // Background to see the full cell
            .cornerRadius(8)
    }
}
