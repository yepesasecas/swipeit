//
//  LDMViewController.m
//  swipeit
//
//  Created by Andres Yepes on 5/29/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "LDMViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@implementation LDMViewController

#pragma mark - Creating and Customizing a MDCSwipeToChooseView

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self photoLoad];
}

#pragma mark - MDCSwipeToChooseDelegate Callbacks

- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
        [self photoLoad];
    } else {
        NSLog(@"Photo saved!");
        [self photoLoad];
    }
}

-(void)photoLoad{
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
    [self.view insertSubview:view belowSubview:view];
}
@end
