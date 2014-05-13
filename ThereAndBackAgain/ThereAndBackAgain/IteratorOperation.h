//
//  IteratorOperation.h
//  ThereAndBackAgain
//
//  Created by CS491 on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyObject.h"

//Create a response block to be used by an outside class
typedef void(^DoubleResponseBlock)(double doubleValue);
typedef void(^SampleObjectBlock) (MyObject *myObj);

@interface IteratorOperation : NSOperation {
    DoubleResponseBlock doubleResponseBlock;
    SampleObjectBlock sampleObjectBlock;
}

-(instancetype)initWithUpdateBlock:(DoubleResponseBlock)completion;
-(instancetype)initWithSampleUpdateBlock:(SampleObjectBlock)completion;
@end
