//
//  MemoryGame.swift
//  Memorize
//
//  Created by Uedson Reis on 10/07/20.
//  Copyright © 2020 FGN. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let index: Int = self.index(of: card)
        self.cards[index].isFaceUp = !self.cards[index].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if (self.cards[index].id == card.id) {
                return index
            }
        }
        return -1
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
