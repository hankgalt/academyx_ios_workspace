//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Grant Stephen Fraga on 10/29/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
  CLLocationManager *locationManager;
  
  IBOutlet MKMapView *worldView;
  IBOutlet UIActivityIndicatorView *activityIndicator;
  IBOutlet UITextField *locationTitleField;
  IBOutlet UISegmentedControl *mapType;
}

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;
- (void)change;

@end
