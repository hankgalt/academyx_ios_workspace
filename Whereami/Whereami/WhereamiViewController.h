//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Grant Stephen Fraga on 10/29/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate>
{
  CLLocationManager *locationManager;
}

@end
