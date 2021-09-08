//
//  QueryTests.swift
//  QueryTests
//
//  Created by Mansur Ahmed on 2021-08-30.
//

import XCTest
@testable import GitHubUsers

class QueryTests: XCTestCase {
    func testToDict() {
        let query = "q"
        let sort = ""
        let order = "asc"
        let resultsPerPage = 10
        let page = 1
        let sut = Query(
            query: query,
            sort: sort,
            order: order,
            resultsPerPage: resultsPerPage,
            page: page
        )
        
        let dict = [
            "q" : query,
            "sort" : sort,
            "order" : order,
            "per_page" : String(resultsPerPage),
            "page" : String(page)
        ]
        
        XCTAssertEqual(sut.toDict(), dict)
    }
}
