//
//  HttpClient.m
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import "HttpClient.h"
#import "Defines.h"

@implementation HttpClient

#pragma mark - Initialization


+ (instancetype)sharedClient
{
    static HttpClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[HttpClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone]];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/javascript",@"application/json",@"text/plain", @"text/json",nil];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    
    return _sharedClient;
}

@end

@implementation PostHttpClient

#pragma mark - Initialization


+ (instancetype)sharedClient
{
    static PostHttpClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[PostHttpClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
//        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/javascript",@"application/json",@"text/plain", @"text/json",nil];

    });
    
    return _sharedClient;
}

@end
