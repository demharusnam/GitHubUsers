//
//  Query.swift
//  Query
//
//  Created by Mansur Ahmed on 2021-08-29.
//

import Foundation

class Query {
    // MARK: Properties
    var query: String
    var sort: String
    var order: String
    var resultsPerPage: Int
    var page: Int
    var isEmpty: Bool { query.isEmpty }
    
    // MARK: Public Methods
    init(
        query: String = "",
        sort: String = "",
        order: String = "desc",
        resultsPerPage: Int = 30,
        page: Int = 1
    ) {
        self.query = query
        self.sort = sort
        self.order = order
        self.resultsPerPage = resultsPerPage
        self.page = page
    }
    
    func toDict() -> [String : String] {
        return [
            "q": query,
            "sort": sort,
            "order": order,
            "per_page": String(resultsPerPage),
            "page": String(page)
        ]
    }
}

extension Query {
    // MARK: Static Methods
    static func fromDict(_ dict: [String : String]) -> Query? {
        guard let query = dict["q"] else { return nil }
        
        return Query(
            query: query,
            sort: dict["sort"] ?? "",
            order: dict["order"] ?? "desc",
            resultsPerPage: Int(dict["per_page"] ?? "30")!,
            page: Int(dict["page"] ?? "1")!
        )
    }
}

extension Query: CustomDebugStringConvertible {
    var debugDescription: String {
        var str = ""
        
        [query, sort, order, String(resultsPerPage), String(page)].forEach {
            str += $0 + " "
        }
        
        return str
    }
}
