//
//  MyObject.m
//  ThereAndBackAgain
//
//  Created by CS491 on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject

-(instancetype)init{
    if (self = [super init]) {
        _test = @"asdf";
        _test2 = @"lkj";
    }
    
    return self;
}

@end
