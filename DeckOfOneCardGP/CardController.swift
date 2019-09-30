//
//  CardController.swift
//  DeckOfOneCardGP
//
//  Created by Michael Flowers on 9/30/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class CardController {
    //step 1 get the url
    private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCard(numberOfCards: Int, completion: @escaping ((_ cards: [Card]) -> Void)){
        
        //first thing we need to do is construct the url
        guard let url = self.baseURL else { fatalError("URL is invalid") }
        
        //are we going to add any query items or components, if so then we initialize urlcomponents
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        //append the url with components or query items
        // / = components. ? = query item
        let cardCountQueryitem = URLQueryItem(name: "count", value: "\(numberOfCards)")
        components?.queryItems = [cardCountQueryitem]
        
        guard let finalURL = components?.url else { return }
        print(finalURL)
        
        //start data task
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error with data task: \(error)")
            }
            guard let data = data else { return }
            
            do {
                let jd = JSONDecoder()
                let cards = try jd.decode(TopLevelDictionary.self, from: data).cards
                completion(cards)
            } catch {
                print("Error decoding data: \(error)")
            }
            
        }
        dataTask.resume()
    }
}
