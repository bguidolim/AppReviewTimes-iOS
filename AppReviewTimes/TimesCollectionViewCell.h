//
//  TimesCollectionViewCell.h
//  AppReviewTimes
//
//  Created by Bruno Guidolim on 2/21/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimesCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *storeImageView;
@property (weak, nonatomic) IBOutlet UILabel *daysLabel;

@end
