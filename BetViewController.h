//
//  BetViewController.h
//  SaltyBet
//
//  Created by Andrew Kozlik on 8/8/13.
//  Copyright (c) 2013 Andrew Kozlik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UILabel *betStatusLabel;
@property (nonatomic, retain) IBOutlet UILabel *player1NameLabel;
@property (nonatomic, retain) IBOutlet UILabel *player2NameLabel;

@property (nonatomic, retain) IBOutlet UITextField *wagerTextField;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;

@property (nonatomic, retain) IBOutlet UIButton *betPlayer1Btn;
@property (nonatomic, retain) IBOutlet UIButton *betPlayer2Btn;

-(IBAction)quickWager:(id)sender;

@end
