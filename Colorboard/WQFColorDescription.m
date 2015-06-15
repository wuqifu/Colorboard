//
//  WQFColorDescription.m
//  Colorboard
//
//  Created by Wuqifu on 15/6/14.
//  Copyright (c) 2015年 Wuqifu. All rights reserved.
//

#import "WQFColorDescription.h"

@implementation WQFColorDescription

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        _color = [UIColor colorWithRed:0
                                 green:0
                                  blue:1
                                 alpha:1.0 ];
        _name = @"Blue";
    }
    
    return self;
}

@end
