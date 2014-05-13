//
//  NSOperationViewController.m
//  ThereAndBackAgain
//
//  Created by Matthew York on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "NSOperationViewController.h"
#import "IteratorOperation.h"
#import "MyObject.h"

@interface NSOperationViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *StateLabel;

@property NSOperationQueue *queue;
@end

@implementation NSOperationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.tabBarItem.title = @"NSOperation";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _queue = [[NSOperationQueue alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didSelectStart:(id)sender {
    //Do short operation
    //[self doShortOperation];
    
    //Do long operation
    [self doLongOperation];
}

- (IBAction)didSelectReset:(id)sender {
    _progressView.progress = 0;
}

#pragma mark - Operations
-(void)doShortOperation{
    long long totalIterations = 10000000;
    
    for (long long ii = 0; ii < totalIterations; ii++) {
        if (ii %1000000 == 0) {
            double progress = (double)ii/(double)totalIterations;
            _progressView.progress = progress;
        }
    }
    
    _progressView.progress = 1;
}

-(void)doLongOperation{
    //Create a basic operation
    IteratorOperation *operation = [[IteratorOperation alloc] init];
    
    //Queue up lots of tasks, each on a new background thread
    //[_queue addOperation:operation];
    //[_queue addOperation:[IteratorOperation new]]; //It's just shorthand for alloc init
    
    
    NSString *finishedString = @"Finished!";
    _StateLabel.text = @"Started Task...";
    MyObject *myObj = [[MyObject alloc] init];
    myObj.test = @"Changed!";
    
    //Add with update block
    IteratorOperation *operationWithCallback = [[IteratorOperation alloc] initWithUpdateBlock:^(double doubleValue) {
        _progressView.progress = doubleValue;
    }];
    
    //Handle completion (still on a background thread!)
    [operationWithCallback setCompletionBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            _StateLabel.text = myObj.test; //Will say changed as original reference is held
        });
    }];
    [_queue addOperation:operationWithCallback];
    
    //Doesn't matter if the top level object gets changed. The original reference holds.
    myObj = [[MyObject alloc] init];
}

@end
