//
//  NSOperationViewController.m
//  ThereAndBackAgain
//
//  Created by Matthew York on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "NSOperationViewController.h"
#import "IteratorOperation.h"

@interface NSOperationViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

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
    long totalIterations = 10000000;
    
    for (int ii = 0; ii < totalIterations; ii++) {
        if (ii %1000000 == 0) {
            double progress = (double)ii/(double)totalIterations;
            _progressView.progress = progress;
        }
    }
    
    _progressView.progress = 1;
}

-(void)doLongOperation{
    _queue = [[NSOperationQueue alloc] init];
    
    //IteratorOperation *operation = [[IteratorOperation alloc] init];
    
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
    [_queue addOperation:[IteratorOperation new]];
}

@end
