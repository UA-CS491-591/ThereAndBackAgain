//
//  IteratorOperation.m
//  ThereAndBackAgain
//
//  Created by CS491 on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "IteratorOperation.h"

@implementation IteratorOperation

-(void)main{
    [self doLongOperation];
}

-(void)doLongOperation{
    long long totalIterations = 10000000000;
    
    for (int ii = 0; ii < totalIterations; ii++) {
        if (ii %1000000000 == 0) {
            double progress = (double)ii/(double)totalIterations;
        }
    }
}


@end
