//
//  BNRColorDescription.m
//  Colorboard
//
//  Created by iStef on 26.01.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription

-(instancetype)init
{
    self=[super init];
    
    if (self) {
        _color=[UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        _name=@"Blue";
    }
    return self;
}

@end
