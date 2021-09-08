//
//  SearchParametersState.swift
//  SearchParametersState
//
//  Created by Mansur Ahmed on 2021-08-30.
//

import Foundation

enum Sort: String, CaseIterable {
    case bestMatch = ""
    case repositories
    case followers
    case joined

    var userValue: String {
        switch self {
        case .bestMatch:
            return "Best Match"
        case .repositories:
            return "Number of Repositories"
        case .followers:
            return "Number of Followers"
        case .joined:
            return "Date Joined"
        }
    }
}

enum Order: String, CaseIterable {
    case asc
    case desc

    var userValue: String {
        switch self {
        case .asc:
            return "Ascending"
        case .desc:
            return "Descending"
        }
    }
}
