//
//  BaseNavigationController.m
//  AppReviewTimes
//
//  Created by Bruno Guidolim on 2/20/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import "BaseNavigationController.h"
#import <ZGNavigationTitleView.h>

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:50.0/255.0 green:73.0/255.0 blue:110.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[ZGNavigationTitleView appearance] setNavigationBarTitleFontColor:[UIColor whiteColor]];
    [[ZGNavigationTitleView appearance] setNavigationBarSubtitleFontColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
