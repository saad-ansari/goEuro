//
//  HttpClient.h
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import "AFNetworking.h"
@interface HttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

@interface PostHttpClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

@end
