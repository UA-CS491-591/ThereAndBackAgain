//
//  GCDViewController.m
//  ThereAndBackAgain
//
//  Created by Matthew York on 5/13/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation GCDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.tabBarItem.title = @"GCD";
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

- (IBAction)didSelectStartButton:(id)sender {
    //Do short operation
    //[self doShortOperation];
    
    //Do long operation (with threads!)
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
    //Do some things in the background using GCD
    //This one gets you a thread of default priority
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        long long totalIterations = 1000000000;
        
        for (long long ii = 0; ii < totalIterations; ii++) {
            //Grab progress every 10% or so, and update UI
            if (ii %100000000 == 0) {
                double progress = (double)ii/(double)totalIterations;
                
                //Call back to main queue (main thread)
                dispatch_async(dispatch_get_main_queue(), ^{
                    _progressView.progress = progress;
                });
            }
        }
        
        
    });
    
    
}

@end
