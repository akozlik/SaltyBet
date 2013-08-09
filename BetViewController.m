//
//  BetViewController.m
//  SaltyBet
//
//  Created by Andrew Kozlik on 8/8/13.
//  Copyright (c) 2013 Andrew Kozlik. All rights reserved.
//

#import "BetViewController.h"
#import "SaltyAPI.h"

@interface BetViewController ()

@end

@implementation BetViewController

@synthesize betStatusLabel, player1NameLabel, player2NameLabel;
@synthesize betPlayer1Btn, betPlayer2Btn, wagerTextField, usernameTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [player1NameLabel setAdjustsFontSizeToFitWidth:YES];
    [player2NameLabel setAdjustsFontSizeToFitWidth:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(loadBets:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view from its nib.
}

-(void)loadBets:(id)sender
{
    [[SaltyAPI sharedSaltyAPI] getPath:@"betdata.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        
        NSDictionary *response = (NSDictionary *)responseObject;
        
        NSString *status = [response objectForKey:@"status"];
        betStatusLabel.text = [NSString stringWithFormat:@"Bets are %@!", [status uppercaseString]];
        
        NSString *p1Name = [response objectForKey:@"p1name"];
        NSString *p1Total = [response objectForKey:@"p1total"];
        
        NSString *p2Name = [response objectForKey:@"p2name"];
        NSString *p2Total = [response objectForKey:@"p2total"];
        
        if ([p1Total intValue] != 0)
            p1Name = [NSString stringWithFormat:@"%@ ($%@)", p1Name, p1Total];

        if ([p2Total intValue] != 0)
            p2Name = [NSString stringWithFormat:@"%@ ($%@)", p2Name, p2Total];
        
        player1NameLabel.text = p1Name;
        player2NameLabel.text = p2Name;
        
        if ([status isEqualToString:@"locked"])
        {
            [betPlayer1Btn setEnabled:NO];
            [betPlayer2Btn setEnabled:NO];
            
            [betPlayer1Btn setAlpha:0.5];
            [betPlayer2Btn setAlpha:0.5];
        } else
        {
            [betPlayer1Btn setEnabled:YES];
            [betPlayer2Btn setEnabled:YES];
            
            [betPlayer1Btn setAlpha:1];
            [betPlayer2Btn setAlpha:1];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failed: %@", [error localizedDescription]);
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)quickWager:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSString *wager = [button.titleLabel.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    
    wagerTextField.text = wager;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
