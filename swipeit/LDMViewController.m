//
//  LDMViewController.m
//  swipeit
//
//  Created by Andres Yepes on 5/29/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "LDMViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface LDMViewController ()

@end

@implementation LDMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://www.golazzos.com/partidos.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
