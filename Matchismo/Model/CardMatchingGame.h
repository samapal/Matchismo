//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ben Cullen on 1/31/14.
//  Copyright (c) 2014 Ben Cullen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//designated initalizer
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSInteger numberOfCards;
-(void)resetScore;
-(void)setCardNumber:(NSInteger)num;
@end
