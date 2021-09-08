//
//  UserRowView.swift
//  UserRowView
//
//  Created by Mansur Ahmed on 2021-08-28.
//

import SwiftUI

struct UserRowView: View {
    @State var user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.avatar_url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .padding(.trailing, 20)
            .frame(maxWidth: 50)
            
            VStack(alignment: .leading) {
                Text(Image(systemName: user.type == "User" ? "person" : "building")).font(.body) +
                Text(" " + user.login).font(.headline)
            }
            .padding(.leading, -15)
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: .default)
    }
}
