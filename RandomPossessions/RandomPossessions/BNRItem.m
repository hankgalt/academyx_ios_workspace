//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Grant Stephen Fraga on 10/28/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (id)randomItem
{
  NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
  
  NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
  
  NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
  NSInteger nounIndex = rand() % [randomNounList count];
  
  NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                          [randomAdjectiveList objectAtIndex:adjectiveIndex],
                          [randomNounList objectAtIndex:nounIndex]];
  
  int randomValue = rand() % 100;
  
  NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + rand() % 10,
                                  'A' + rand() % 26,
                                  '0' + rand() % 10,
                                  'A' + rand() % 26,
                                  '0' + rand() % 10];
  
  BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
  
  return newItem;
}

- (id)init
{
  return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];
}

- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
  self = [super init];
  
  if (self) {
    [self setItemName:name];
    [self setSerialNumber:sNumber];
    [self setValueInDollars:value];
    dateCreated = [[NSDate alloc] init];
  }
  
  return self;
}

@synthesize itemName, serialNumber, valueInDollars, dateCreated, containedItem, container;

- (void) setContainedItem:(BNRItem *)i
{
  containedItem = i;
  [i setContainer:self];
}

- (NSString *)description
{
  NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): worth $%d, added on %@",
                                 itemName,
                                 serialNumber,
                                 valueInDollars,
                                 dateCreated];
  return descriptionString;
}

@end
