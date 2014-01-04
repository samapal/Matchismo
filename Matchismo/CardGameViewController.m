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
@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController
-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"Flips label changed to %d",self.flipCount);
}
- (IBAction)touchCardButton:(UIButton *)sender
{
    PlayingCardDeck *deck = [[PlayingCardDeck alloc]init];
    PlayingCard *card = [[PlayingCard alloc]init];
    
    if ([sender.currentTitle length]) {
    [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"] forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
    }else
    {
    [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
    card = [deck drawRandomFromDeck];
    NSLog(@"%@",[card contents]);
    [sender setTitle:[card contents] forState:UIControlStateNormal];
    card = nil;
    }
    self.flipCount++;
}


@end
