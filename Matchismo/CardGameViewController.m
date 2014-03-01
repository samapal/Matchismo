//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Ben Cullen on 12/26/13.
//  Copyright (c) 2013 Ben Cullen. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Deck.h"
#import "cardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

-(CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[[self cardButtons]count] usingDeck:[self createDeck]];
    return _game;
}


- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}

- (IBAction)dealCards:(id)sender
{
    [self resetUI];
    [[self game]resetScore];
}

-(void)resetUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSInteger cardButtonindex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonindex];
        [card setChosen:NO];
        [card setMatched:NO];
        cardButton.enabled = YES;
        [cardButton setTitle:@"" forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
    }//Turn over all cards,reset title and image
   self.scoreLabel.text = @"Score:0"; //Reset score Label
    
}
@end
