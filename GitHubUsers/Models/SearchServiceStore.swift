//
//  UserServiceStore.swift
//  SearchServiceStore
//
//  Created by Mansur Ahmed on 2021-08-27.
//

import Foundation

actor SearchServiceStore {
    // MARK: Private Methods
    private func urlFromComponents(with query: [String : String]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/search/users"
        components.setQueryItems(with: query)
        return components.url!
    }
    
    // MARK: Public Methods
    func fetch(with query: [String : String]) async throws -> [User] {
        guard let url = urlFromComponents(with: query) else {
            throw HTTPRequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPRequestError.badResponse
        }
        
//        print(httpResponse.statusCode, url)
        
        switch httpResponse.statusCode {
        case 200:
            break
        case 403:
            throw HTTPRequestError.exceededAPILimit
        default:
//            print("error unexpected response: \(httpResponse.statusCode)")
            throw HTTPRequestError.badResponse
        }
        
        guard let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) else {
            throw HTTPRequestError.decodeError
        }
        
        return decodedResponse.items
    }
}
