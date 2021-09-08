//
//  UserListView.swift
//  UserListView
//
//  Created by Mansur Ahmed on 2021-08-30.
//

import SwiftUI

struct UserListView: View {
    // MARK: Properties
    @EnvironmentObject var searchService: SearchService
    @State private var error: HTTPRequestError?
    @State private var isShowingSheet: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var query: String = ""
    
    var body: some View {
        List(searchService.results) { user in
            UserRowView(user: user)
            .frame(height: 40)
            .redacted(reason: searchService.isFetching ? .placeholder : [])
            .task {
                if user == searchService.results.last {
                    await fetch()
                }
            }
        }
//        .opacity(searchService.results.isEmpty ? 0 : 1)
//        .background {
//            if searchService.results.isEmpty {
//                VStack {
//                    EmptyListView()
//                        .padding(.top, 50)
//
//                    Spacer()
//                }
//            }
//        }
        .searchable(
            text: $query,
            prompt: Text("Search for GitHub users...")
        )
        .onSubmit(of: .search, search)
        .refreshable(action: refresh)
        .navigationTitle("GitHub Users")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button(
                        action: { isShowingSheet = true },
                        label: { Label("Search Parameters", image: "sliders") }
                    )
                }
            }
        }
        .sheet(isPresented: $isShowingSheet, onDismiss: syncRefresh) {
            SearchParametersView(
                sort: $searchService.sort,
                order: $searchService.order,
                resultsPerPage: $searchService.resultsPerPage
            )
        }
        .alert(isPresented: $isShowingAlert, error: error) { _ in
            Button("OK") {
                self.isShowingAlert = false
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "Unkown error occured. Please try again.")
        }
    }
    
    // MARK: Private Methods
    private func fetch() async {
        await performSafeRequest(for: searchService.fetch)
    }
    
    @Sendable
    private func refresh() async {
        if !searchService.results.isEmpty {
            await performSafeRequest(for: searchService.refresh)
        }
    }
    
    private func syncRefresh() {
        Task {
            await refresh()
        }
    }
    
    private func search() {
        searchService.query = query
        
        Task {
            await performSafeRequest(for: searchService.search)
        }
    }
    
    private func performSafeRequest(for asyncFunc: (() async throws -> Void)) async {
        do {
            try await asyncFunc()
        } catch {
            if let error = error as? HTTPRequestError {
                handleError(error: error)
            } else {
                handleError(error: HTTPRequestError.noInternetConnection)
            }
        }
    }
    
    private func handleError(error: Error) {
        self.error = error as? HTTPRequestError
        isShowingAlert = true
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
