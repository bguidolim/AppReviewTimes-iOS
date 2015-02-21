//
//  LastCollectionViewCell.m
//  AppReviewTimes
//
//  Created by Bruno Guidolim on 2/21/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import "LastCollectionViewCell.h"
#import <Social/Social.h>
#import <AFNetworking.h>

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

#pragma mark - Custom Methods
- (BOOL)validateUrl:(NSString *)candidate {
    NSString *urlRegEx = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

#pragma mark - IBActions
- (IBAction)submitTwitterButtonPressed:(id)sender {
    if (self.daysTextField.text.length != 0) {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
        NSString *initialText = @"Last review";
        if (self.appNameTextField.text.length != 0) initialText = [initialText stringByAppendingString:[NSString stringWithFormat:@" for %@",self.appNameTextField.text]];
        if (self.appUrlTextField.text.length != 0 && [self validateUrl:self.appUrlTextField.text]) [tweetSheet addURL:[NSURL URLWithString:self.appUrlTextField.text]];
        initialText = [initialText stringByAppendingString:[NSString stringWithFormat:@" took %@ days ",self.daysTextField.text]];
        
        if (self.typeSegementedControl.selectedSegmentIndex == 0) {
            initialText = [initialText stringByAppendingString:@"#iosreviewtime"];
        } else {
            initialText = [initialText stringByAppendingString:@"#macreviewtime"];
        }
        
        [tweetSheet setInitialText:initialText];
        
        [self.parentViewController presentViewController:tweetSheet animated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Hey! Take a look" message:@"Insert the numbers of days your app took to be reviewed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }
}

@end
