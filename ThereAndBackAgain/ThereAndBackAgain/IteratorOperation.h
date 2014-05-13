//
//  IteratorOperation.h
//  ThereAndBackAgain
//
//  Created by CS491 on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import <Foundation/Foundation.h>

//Create a response block to be used by an outside class
typedef void(^DoubleResponseBlock)(double doubleValue);

@interface IteratorOperation : NSOperation {
    DoubleResponseBlock doubleResponseBlock;
}

-(instancetype)initWithUpdateBlock:(DoubleResponseBlock)completion;
@end
