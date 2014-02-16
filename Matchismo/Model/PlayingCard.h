//
//  PlayingCard.h
//  Matchismo
//
//  Created by Ben Cullen on 12/26/13.
//  Copyright (c) 2013 Ben Cullen. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+(NSArray*)validSuits;
+(NSUInteger)maxRank;
@end
