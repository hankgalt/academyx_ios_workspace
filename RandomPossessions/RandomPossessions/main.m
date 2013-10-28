//
//  main.m
//  RandomPossessions
//
//  Created by Grant Stephen Fraga on 10/28/13.
//  Copyright (c) 2013 com.academyx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool {
      
    // Create a mutable array object, store its address in items variable
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
      BNRItem *p = [BNRItem randomItem];
      [items addObject:p];
    }
    
    for (int i = 0; i < [items count]; i++) {
      NSLog(@"%@", [items objectAtIndex:i]);
    }

    items = nil;
    
  }
  return 0;
}

