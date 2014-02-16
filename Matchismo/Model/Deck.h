//
//  Deck.h
//  Matchismo
//
//  Created by Ben Cullen on 12/26/13.
//  Copyright (c) 2013 Ben Cullen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
@property (strong,nonatomic) Deck *deck;
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(NSMutableArray *)cards;
-(Card *)drawRandomCard;
@end
