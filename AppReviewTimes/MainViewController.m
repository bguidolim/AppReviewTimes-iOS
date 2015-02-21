//
//  MainViewController.m
//  AppReviewTimes
//
//  Created by Bruno Guidolim on 2/20/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import "MainViewController.h"
#import <Parse/Parse.h>
#import <SVProgressHUD.h>
#import "TimesCollectionViewCell.h"

@interface MainViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) PFObject *parseObject;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeGradient];
    PFQuery *query = [PFQuery queryWithClassName:@"reviewtimes"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        [SVProgressHUD dismiss];
        
        if (error) {
            #warning Error
        } else {
            self.parseObject = object;
            
            [self.collectionView reloadData];
        }
    }];
}

#pragma mark - UICollectionViewDatasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.parseObject) {
        return 2;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TimesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TimesCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"iOS App Store";
        cell.storeImageView.image = [UIImage imageNamed:@"ios-image"];
        cell.daysLabel.text = [NSString stringWithFormat:@"%d days", [[self.parseObject objectForKey:@"ios_days"] integerValue]];
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = @"Mac App Store";
        cell.storeImageView.image = [UIImage imageNamed:@"mac-image"];
        cell.daysLabel.text = [NSString stringWithFormat:@"%d days", [[self.parseObject objectForKey:@"mac_days"] integerValue]];
    }
    
    return cell;
}

@end
