//
//  SearchParametersView.swift
//  SearchParametersView
//
//  Created by Mansur Ahmed on 2021-08-27.
//

import SwiftUI

struct SearchParametersView: View {
    // MARK: Properties
    @Environment(\.dismiss) private var dismiss
    @Binding var sort: Sort
    @Binding var order: Order
    @Binding var resultsPerPage: Int
    @State private var sortParameter: Sort
    @State private var orderParameter: Order
    @State private var resultsPerPageParameter: Int
    
    init(sort: Binding<Sort>, order: Binding<Order>, resultsPerPage: Binding<Int>) {
        self._sort = sort
        self._order = order
        self._resultsPerPage = resultsPerPage
        
        self._sortParameter = State(initialValue: sort.wrappedValue)
        self._orderParameter = State(initialValue: order.wrappedValue)
        self._resultsPerPageParameter = State(initialValue: resultsPerPage.wrappedValue)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Sort", selection: $sortParameter) {
                    ForEach(Sort.allCases, id: \.self) {
                        Text($0.userValue)
                    }
                }
                
                Picker("Order", selection: $orderParameter) {
                    ForEach(Order.allCases, id: \.self) {
                        Text($0.userValue)
                    }
                }
                
                Stepper(value: $resultsPerPageParameter, in: 1...100) {
                    Text(String(resultsPerPageParameter)).font(.headline) +
                    Text(" Results per Page")
                }
            }
            .navigationTitle("Search Parameters")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button(action: updateSearchParameters) {
                        Text("Done")
                            .font(.headline)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button(action: resetParameters) {
                        Text("Reset")
                            .font(.headline)
                    }
                }
            }
        }
    }
    
    private func updateSearchParameters() {
        sort = sortParameter
        order = orderParameter
        resultsPerPage = resultsPerPageParameter
        dismiss()
    }
    
    private func resetParameters() {
        sort = .bestMatch
        order = .desc
        resultsPerPage = 30
        
        sortParameter = sort
        orderParameter = order
        resultsPerPageParameter = resultsPerPage
    }
}

struct SearchParametersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchParametersView(sort: .constant(.bestMatch), order: .constant(.desc), resultsPerPage: .constant(30))
    }
}
