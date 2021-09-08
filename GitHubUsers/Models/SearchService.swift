//
//  SearchService.swift
//  SearchService
//
//  Created by Mansur Ahmed on 2021-08-27.
//

import Foundation

class SearchService: ObservableObject {
    // MARK: Private Properties
    @Published private(set) var results = [User]()
    @Published private(set) var isFetching = false
    private var refreshing = false
    private var firstSearch = false
    private var searchQuery = Query()
    private let store = SearchServiceStore()
    
    // MARK: Public Properties
    var queryIsEmpty: Bool {
        searchQuery.isEmpty
    }
    
    var query: String {
        get {
            searchQuery.query
        }
        set {
            searchQuery.query = newValue
        }
    }
    
    var sort: Sort {
        get {
            Sort(rawValue: searchQuery.sort) ?? .bestMatch
        }
        set {
            searchQuery.sort = newValue.rawValue
        }
    }
    
    var order: Order {
        get {
            Order(rawValue: searchQuery.order) ?? .desc
        }
        set {
            searchQuery.order = newValue.rawValue
        }
    }
    
    var page: Int {
        get {
            searchQuery.page
        }
        set {
            searchQuery.page = newValue
        }
    }
    
    var resultsPerPage: Int {
        get {
            searchQuery.resultsPerPage
        }
        set {
            searchQuery.resultsPerPage = newValue
        }
    }

    // MARK: Public Methods
    init() {}
    
    @MainActor
    func fetch() async throws {
        let reseting = refreshing || firstSearch
        
        page = reseting ? 1 : page + 1
        
        let query = searchQuery.toDict()
        
        isFetching = true
        defer { isFetching = false }
        
        let fetchResults = try await store.fetch(with: query)
        
        if reseting {
            self.results.removeAll()
        }
        
        self.results.append(contentsOf: fetchResults)
    }
    
    func refresh() async throws {
        refreshing = true
        defer { refreshing = false }
        try await fetch()
    }
    
    func search() async throws {
        firstSearch = true
        defer { firstSearch = false }
        try await fetch()
    }
}
