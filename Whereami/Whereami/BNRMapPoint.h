//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Grant Stephen Fraga on 10/29/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>

// New designated initializer
- (id)initWithCoordinate: (CLLocationCoordinate2D)c title:(NSString *)t;

// Required property from MKAnnotation protocol
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// Optional property from MKAnnotation protocol
@property (nonatomic, copy) NSString *title;

@end
