//
//  Response.swift
//  Response
//
//  Created by Mansur Ahmed on 2021-08-27.
//

struct Response: Decodable {
    var total_count: Int
    var incomplete_results: Bool
    var items: [User]
}
