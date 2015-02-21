//
//  LastCollectionViewCell.h
//  AppReviewTimes
//
//  Created by Bruno Guidolim on 2/21/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit.h>
#import "BaseTextField.h"

@interface LastCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet BaseTextField *daysTextField;
@property (weak, nonatomic) IBOutlet FUISegmentedControl *typeSegementedControl;
@property (weak, nonatomic) IBOutlet BaseTextField *nameTextField;
@property (weak, nonatomic) IBOutlet BaseTextField *appNameTextField;
@property (weak, nonatomic) IBOutlet BaseTextField *appUrlTextField;
@property (weak, nonatomic) IBOutlet FUIButton *submitDirectlyButton;
@property (weak, nonatomic) IBOutlet FUIButton *submitTwitterButton;

@end
