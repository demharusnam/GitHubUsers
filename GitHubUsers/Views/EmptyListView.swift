//
//  EmptyListView.swift
//  EmptyListView
//
//  Created by Mansur Ahmed on 2021-08-30.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Text(Image(systemName: "arrow.up"))
                .font(.largeTitle)
                .padding(.bottom)
            
            Group {
                Text("Ruh roh. Seems like you haven't searched anything yet. Tap the search bar above to get started.\n\nAs a reminder, GitHub only allows the following characters for usernames:")
                    .bold()
                
                Text("\t- Alphanumeric (letters and numbers)\n\t- Dashes (-)")
            }
        }
        .frame(width: 350)
        .foregroundColor(.secondary)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
