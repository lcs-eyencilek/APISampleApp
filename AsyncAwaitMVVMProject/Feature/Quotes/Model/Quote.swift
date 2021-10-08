//
//  Quote.swift
//  AsyncAwaitMVVMProject
//
//  Created by Efe Yencilek on 2021-10-07.
//

import Foundation

struct Quote: Decodable {
    // The parameter passed in will be a JSON dict
    let anime: String
    let character: String
    let quote: String

}

extension Quote {
    static let dummyData: [Quote] = [
        Quote(anime: "Anime 1", character: "Character 1", quote: "Quote 1")
    ]
}
