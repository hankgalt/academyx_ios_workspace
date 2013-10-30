//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Grant Stephen Fraga on 10/29/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  
  if (self) {
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
  }
  
  return self;
}

- (void)viewDidLoad
{
  NSLog(@"viewDidLoad()");
  [worldView setShowsUserLocation:YES];
  
  [mapType addTarget:self action:@selector(change) forControlEvents:UIControlEventValueChanged];
}

- (void)change
{
  [worldView setMapType:[mapType selectedSegmentIndex]];
}

- (void)mapView: (MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
  NSLog(@"didUpdateUserLocation() - %@", [userLocation location]);
  CLLocationCoordinate2D loc = [userLocation coordinate];
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
  [worldView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
  NSLog(@"didUpdateToLocation() - new coord: %@, old coord: %@", newLocation, oldLocation);
  
  NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
  
  if (t < -180) {
    return;
  }
  
  [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
  NSLog(@"didFailWithError() - Could not find location: %@", error);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
  NSLog(@"textFieldShouldReturn()");
  [self findLocation];
  
  [textField resignFirstResponder];
  
  return YES;
}

- (void)findLocation
{
  NSLog(@"findLocation()");
  
  [locationManager startUpdatingLocation];
  [activityIndicator startAnimating];
  [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
  CLLocationCoordinate2D coord = [loc coordinate];
  
  // Create an instance of BNRMapPoint with current data
  BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
  
  // Add it to map view
  [worldView addAnnotation:mp];
  
  if ([worldView mapType] == MKMapTypeStandard) {
    [worldView setMapType:MKMapTypeSatellite];
  } else if ([worldView mapType] == MKMapTypeSatellite) {
    [worldView setMapType:MKMapTypeStandard];
  }
  
  // Zoom the region to this location
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
  [worldView setRegion:region animated:YES];
  
  // Reset the UI
  [locationTitleField setText:@""];
  [activityIndicator stopAnimating];
  [locationTitleField setHidden:NO];
  [locationManager stopUpdatingLocation];
}

- (void)dealloc
{
  [locationManager setDelegate:nil];
}

@end
