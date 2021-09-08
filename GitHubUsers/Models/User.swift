//
//  User.swift
//  User
//
//  Created by Mansur Ahmed on 2021-08-27.
//

import Foundation

struct User: Decodable, Equatable, Identifiable {
    var login: String
    var id: Int
    var node_id: String
    var avatar_url: String
    var gravatar_id: String
    var url: String
    var html_url: String
    var followers_url: String
    var subscriptions_url: String
    var organizations_url: String
    var repos_url: String
    var received_events_url: String
    var type: String
    var score: Int
    var following_url: String
    var gists_url: String
    var starred_url: String
    var events_url: String
    var site_admin: Bool
}

// MARK: Static Properties
extension User {
    static var `default`: User {
        // Sample user taken from GitHub search user API example
        // https://docs.github.com/en/rest/reference/search#search-users
        
        User(
            login: "mojombo",
            id: 1,
            node_id: "MDQ6VXNlcjE=",
            avatar_url: "https://secure.gravatar.com/avatar/25c7c18223fb42a4c6ae1c8db6f50f9b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
            gravatar_id: "",
            url: "https://api.github.com/users/mojombo",
            html_url: "https://github.com/mojombo",
            followers_url: "https://api.github.com/users/mojombo/followers",
            subscriptions_url: "https://api.github.com/users/mojombo/subscriptions",
            organizations_url: "https://api.github.com/users/mojombo/orgs",
            repos_url: "https://api.github.com/users/mojombo/repos",
            received_events_url: "https://api.github.com/users/mojombo/received_events",
            type: "User",
            score: 1,
            following_url: "https://api.github.com/users/mojombo/following{/other_user}",
            gists_url: "https://api.github.com/users/mojombo/gists{/gist_id}",
            starred_url: "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
            events_url: "https://api.github.com/users/mojombo/events{/privacy}",
            site_admin: true
        )
    }
}
