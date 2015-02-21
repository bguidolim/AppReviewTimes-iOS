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
#import <NSDate+TimeAgo.h>
#import "TimesCollectionViewCell.h"
#import "LastCollectionViewCell.h"
#import "ZGNavigationBarTitleViewController.h"

@interface MainViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) PFObject *parseObject;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)reloadData:(BOOL)localStore {
    [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeGradient];
    
    PFQuery *query = [PFQuery queryWithClassName:@"reviewtimes"];
    if (localStore) {
        [query fromLocalDatastore];
    }
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        [SVProgressHUD dismiss];
        
        if (error) {
            if (!localStore) {
                [self reloadData:YES];
            } else {
                [[[UIAlertView alloc] initWithTitle:@"Error" message:@"The operation couldn’t be completed. Check your internet connection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
            
        } else {
            self.parseObject = object;
            [self.parseObject pinInBackground];
            self.subtitle = [NSString stringWithFormat:@"Last update: %@",[self.parseObject.updatedAt timeAgo]];
            
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
        return 3;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        
        TimesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TimesCell" forIndexPath:indexPath];
        cell.titleLabel.text = @"iOS App Store";
        cell.storeImageView.image = [UIImage imageNamed:@"ios-image"];
        cell.daysLabel.text = [NSString stringWithFormat:@"%ld days", (long)[[self.parseObject objectForKey:@"ios_days"] integerValue]];
        
        return cell;
        
    } else if (indexPath.row == 1) {
        
        TimesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TimesCell" forIndexPath:indexPath];
        cell.titleLabel.text = @"Mac App Store";
        cell.storeImageView.image = [UIImage imageNamed:@"mac-image"];
        cell.daysLabel.text = [NSString stringWithFormat:@"%ld days", (long)[[self.parseObject objectForKey:@"mac_days"] integerValue]];
        
        return cell;
        
    } else if (indexPath.row == 2) {
        
        LastCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LastCell" forIndexPath:indexPath];
        //cell.lastUpdateLabel.text = [NSString stringWithFormat:@"Last update: %@",[self.parseObject.updatedAt timeAgo]];
        
        return cell;
    }
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 374);
    }
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 132);
}

@end
