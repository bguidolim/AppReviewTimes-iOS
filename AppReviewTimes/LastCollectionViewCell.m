//
//  LastCollectionViewCell.m
//  AppReviewTimes
//
//  Created by Bruno Guidolim on 2/21/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import "LastCollectionViewCell.h"

@implementation LastCollectionViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIColor *darkBlueColor = [UIColor colorWithRed:50.0/255.0 green:73.0/255.0 blue:110.0/255.0 alpha:1.0];
    
    self.typeSegementedControl.selectedFont = [UIFont systemFontOfSize:15];
    self.typeSegementedControl.selectedFontColor = [UIColor whiteColor];
    self.typeSegementedControl.deselectedFont = [UIFont systemFontOfSize:15];
    self.typeSegementedControl.deselectedFontColor = [UIColor cloudsColor];
    self.typeSegementedControl.selectedColor = darkBlueColor;
    self.typeSegementedControl.deselectedColor = [UIColor silverColor];
    self.typeSegementedControl.dividerColor = [UIColor whiteColor];
    self.typeSegementedControl.cornerRadius = 3.0;
    
    self.submitDirectlyButton.buttonColor = darkBlueColor;
    self.submitDirectlyButton.cornerRadius = 3.0f;
    [self.submitDirectlyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitDirectlyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    self.submitDirectlyButton.buttonColor = darkBlueColor;
    self.submitDirectlyButton.cornerRadius = 3.0f;
    [self.submitDirectlyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitDirectlyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    self.submitTwitterButton.buttonColor = [UIColor colorWithRed:85.0/255.0 green:172.0/255.0 blue:238.0/255.0 alpha:1.0];;
    self.submitTwitterButton.cornerRadius = 3.0f;
    [self.submitTwitterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitTwitterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}

@end
