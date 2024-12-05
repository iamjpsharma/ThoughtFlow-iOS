//
//  ThoughtFlowCellUIView.swift
//  ThoughtFlow
//
//  Created by jaiprakash sharma on 06/12/24.
//

import SwiftUI

struct ThoughtFlowCellUIView: View {
    
    var thoughtFlow: ThoughtFlows
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(String(describing: thoughtFlow.title ?? "Empty Title"))")
                .font(.headline)
                .foregroundColor(.primary)

            Text("\(String(describing: thoughtFlow.details ?? ""))")
                .font(.body)
                .foregroundColor(.secondary)

            HStack {
                Spacer()
                if let timestamp = thoughtFlow.timestamp {
                    Text("\(DateFormatterUtils.relativeDateString(from: timestamp))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}

struct ThoughtFlowCellUIView_Previews: PreviewProvider {
    static var previews: some View {
        // Creating a mock ThoughtFlows object for the preview
        let mockThoughtFlow = ThoughtFlows(context: PersistenceController.preview.container.viewContext)
        mockThoughtFlow.timestamp = Date() // Set a mock timestamp
        mockThoughtFlow.details = "moked details"
        mockThoughtFlow.title = "title"
        return ThoughtFlowCellUIView(thoughtFlow: mockThoughtFlow)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.1)) // Background to see the full cell
            .cornerRadius(8)
    }
}
