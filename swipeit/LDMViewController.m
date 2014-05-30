//
//  LDMViewController.m
//  swipeit
//
//  Created by Andres Yepes on 5/29/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "LDMViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@interface LDMViewController ()

@end

@implementation LDMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Keep";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Delete";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.view.bounds
                                                                     options:options];
    view.imageView.image = [UIImage imageNamed:@"photo"];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
