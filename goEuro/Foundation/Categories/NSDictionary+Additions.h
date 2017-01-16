//
//  NSDictionary+Additions.h
//  SWFoundation
//
//  Created by Irfan Bashir on 6/27/12.
//  Copyright (c) 2012 UCS Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface NSDictionary (Additions)
- (NSString *)currencyStringForKey:(id)key;
- (NSString *)stringForKey:(id)key;
- (NSString *)dateStringForKey:(id)key withDateFormat:(NSDateFormatterStyle)format;

@end


@interface UIImage (Additions)
+(UIImage *)imageNamed:(NSString *)name cache:(BOOL)cache;
@end


// UIPopoverController+iPhone.h file
@interface UIPopoverController (iPhone)
+ (BOOL)_popoversDisabled;
@end

@interface MKMapView (ZoomLevel)
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;

-(double) getZoomLevel;
@end



@implementation MKMapView (ZoomLevel)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel animated:(BOOL)animated {
    MKCoordinateSpan span = MKCoordinateSpanMake(0, 360/pow(2, zoomLevel)*self.frame.size.width/256);
    [self setRegion:MKCoordinateRegionMake(centerCoordinate, span) animated:animated];
}


-(double) getZoomLevel {
    return log2(360 * ((self.frame.size.width/256) / self.region.span.longitudeDelta));
}

@end
