//
//  IteratorOperation.m
//  ThereAndBackAgain
//
//  Created by CS491 on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "IteratorOperation.h"

@implementation IteratorOperation

#pragma mark - Constructors

-(instancetype)initWithUpdateBlock:(DoubleResponseBlock)completion{
    
    if (self = [super init]) {
        doubleResponseBlock = completion;
    }
    
    return self;
}

#pragma mark - Operations

-(void)main{
    [self doLongOperation];
}

-(void)doLongOperation{
    //Define the total number of iterations
    long long totalIterations = 1000000000;
    
    for (long long ii = 0; ii < totalIterations; ii++) {
        if (ii %100000000 == 0) {
            //Get the progress of our long running task
            double progress = (double)ii/(double)totalIterations;
            
            //Hop back to the main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //Make sure the block exists before calling
                if (doubleResponseBlock != NULL) {
                    //Call back to anyone listening for a progress update on our long operation
                    doubleResponseBlock(progress);
                }
                
            });
        }
    }
    
    //Call back one more time with the finished value
    doubleResponseBlock(1.0);
    
}


@end
