//
//  BNRItem.h
//  RandomPossessions
//
//  Created by Grant Stephen Fraga on 10/28/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
  NSString *itemName;
  NSString *serialNumber;
  int valueInDollars;
  NSDate *dateCreated;
}

+ (id)randomItem;

- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;

- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)i;
- (int)valueInDollars;

- (NSDate *)dateCreated;

@end
