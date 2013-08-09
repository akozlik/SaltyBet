//
//  SaltyAPI.m
//  SaltyBet
//
//  Created by Andrew Kozlik on 8/8/13.
//  Copyright (c) 2013 Andrew Kozlik. All rights reserved.
//

#import "SaltyAPI.h"

@implementation SaltyAPI

+(SaltyAPI *)sharedSaltyAPI
{
    NSString *urlStr = @"http://www.saltybet.com";
    
    static dispatch_once_t pred;
    static SaltyAPI *_sharedSaltyAPI = nil;
    
    dispatch_once(&pred, ^{ _sharedSaltyAPI = [[self alloc] initWithBaseURL:[NSURL URLWithString:urlStr]]; });
    return _sharedSaltyAPI;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
