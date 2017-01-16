//
//  Base.h
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import "AFNetworking.h"


@protocol RequestDelegate <NSObject>

- (void) didReceiveResponse:(id) data;
- (void) didFailWithError:(NSError *)error;

@end

@interface Base : NSObject
{
    id <RequestDelegate>delegate;
}

- (void)callGetService:(id)_delegate withName:(NSString *)service;
- (void)callPostService:(id)_delegate withName:(NSString *)service withParameter:(NSDictionary*)param;



@end
    
