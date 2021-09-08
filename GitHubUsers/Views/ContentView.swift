//
//  ContentView.swift
//  GitHubUsers
//
//  Created by Mansur Ahmed on 2021-08-27.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var searchService = SearchService()
    
    var body: some View {
        NavigationView {
            UserListView()
        }
        .environmentObject(searchService)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
