//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Grant Stephen Fraga on 10/29/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate, title;

- (id)init
{
  return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

- (id)initWithCoordinate: (CLLocationCoordinate2D)c title:(NSString *)t
{
  self = [super init];
  if (self) {
    coordinate = c;
    [self setTitle:t];
  }
  return self;
}

@end
