//
//  SaltyAPI.h
//  SaltyBet
//
//  Created by Andrew Kozlik on 8/8/13.
//  Copyright (c) 2013 Andrew Kozlik. All rights reserved.
//

#import "AFHTTPClient.h"

@interface SaltyAPI : AFHTTPClient

+ (SaltyAPI *)sharedSaltyAPI;
- (id)initWithBaseURL:(NSURL *)url;

@end
