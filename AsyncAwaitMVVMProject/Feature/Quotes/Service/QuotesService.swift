//
//  QuotesService.swift
//  AsyncAwaitMVVMProject
//
//  Created by Efe Yencilek on 2021-10-07.
//

import Foundation

protocol QuotesService{
    @available(iOS 15.0.0, *)
    func fetch() async throws -> [Quote]
}

final class QuotesServiceImpl: QuotesService {
    @available(iOS 15.0.0, *)
    func fetch() async throws -> [Quote] {
        // Create a url session
        let urlSession = URLSession.shared
        // Create your url with appending the route onto the base link
        let url = URL(string: APIConstants.baseUrl.appending("/api/quotes"))
        let (data, _) = try await urlSession.data(from: url!)
        // Decode the json data in the formate of an array of quotes, the reason why we conformed the quote struct to decodable is to be able to use it here as a decoding format
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
