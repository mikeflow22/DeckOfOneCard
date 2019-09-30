//
//  Card.swift
//  DeckOfOneCardGP
//
//  Created by Michael Flowers on 9/30/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable  {
    let cards: [Card]
}

struct Card: Codable {
    let image: String
    let suit: String
    let code: String
}
