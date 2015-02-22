//
//  BaseTextField.m
//  AppReviewTimes
//
//  Created by Bruno Guidolim on 2/21/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import "BaseTextField.h"
#import <FlatUIKit.h>
#import <QuartzCore/QuartzCore.h>

@implementation BaseTextField

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    self.backgroundColor = [UIColor clearColor];
    self.edgeInsets = UIEdgeInsetsMake(4.0f, 15.0f, 4.0f, 15.0f);
    self.textFieldColor = [UIColor whiteColor];
    self.borderColor = [UIColor colorWithRed:50.0/255.0 green:73.0/255.0 blue:110.0/255.0 alpha:1.0];
    self.borderWidth = 2.0f;
    self.cornerRadius = 3.0f;
    
    self.layer.borderColor = [UIColor silverColor].CGColor;
    self.layer.borderWidth = 2.0f;
    self.layer.cornerRadius = 3.0f;
}

- (BOOL)becomeFirstResponder {
    [super becomeFirstResponder];
    self.layer.borderWidth = 0.0f;
    
    return YES;
}

- (BOOL)resignFirstResponder {
    [super resignFirstResponder];
    self.layer.borderWidth = 2.0f;
    
    return YES;
}

@end
