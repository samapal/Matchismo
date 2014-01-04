//
//  PlayingCardDeck.h
//  Matchismo
//
//  Created by Ben Cullen on 12/26/13.
//  Copyright (c) 2013 Ben Cullen. All rights reserved.
//

#import "Deck.h"
#import "PlayingCard.h"
@interface PlayingCardDeck : Deck
-(PlayingCard*)drawRandomFromDeck;
@end
