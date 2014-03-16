//
//  PlayingCard.m
//  Matchismo
//
//  Created by Ben Cullen on 12/26/13.
//  Copyright (c) 2013 Ben Cullen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+(NSArray *)validSuits
{
    return @[@"♦︎",@"♠︎",@"♣︎",@"♥︎"];
}

+(NSArray*)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
   return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

-(NSString*)suit
{
    return _suit ? _suit : @"?";
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+(NSUInteger)maxRank { return [[self rankStrings]count]-1;}

-(void)setRank:(NSInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;   
    }
}

-(int)match:(NSArray *)otherCards
{
    int score=0;
    
    if (otherCards.count > 0)
    {
        for ( PlayingCard *otherCard in otherCards)
        {
            if (otherCard.rank == self.rank)
            {
                score += 4;
            }
            else if ([otherCard.suit isEqualToString:self.suit])
            {
                score += 1;
            }
        }
    }
    return score;
}
@end
