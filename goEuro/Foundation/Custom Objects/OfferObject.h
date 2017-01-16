//
//  OfferObject.h
//  goEuro
//
//  Created by guzzle developer on 1/16/17.
//  Copyright © 2017 goEuro developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OfferObject : NSObject
{
    int offer_id;
    NSString *provider_logo;
    NSString *price_in_euros;
    NSString *departure_time;
    NSString *arrival_time;
    NSString *duration_time;
    int number_of_stops;
    NSDate *departureTime;
    NSDate *arrivalTime;
    NSDate *durationTime;

}
@property(nonatomic,assign)int offer_id;
@property(nonatomic,strong)NSString *provider_logo;
@property(nonatomic,strong)NSString *price_in_euros;
@property(nonatomic,strong)NSString *departure_time;
@property(nonatomic,strong)NSString *arrival_time;
@property(nonatomic,assign)int number_of_stops;
@property(nonatomic,strong)NSString *duration_time;
@property(nonatomic,strong)NSDate *departureTime;
@property(nonatomic,strong)NSDate *arrivalTime;
@property(nonatomic,strong)NSDate *durationTime;

@end
