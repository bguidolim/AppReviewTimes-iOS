//
//  TodayViewController.m
//  App Review Times
//
//  Created by Guilherme Mogames on 2/21/15.
//  Copyright (c) 2015 Bruno Guidolim. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <Parse/Parse.h>
#import <NSDate+TimeAgo.h>

@interface TodayViewController () <NCWidgetProviding>
- (IBAction)openApp:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *iosLabel;
@property (strong, nonatomic) IBOutlet UILabel *macLabel;
@property (strong, nonatomic) IBOutlet UILabel *updateLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Parse enableLocalDatastore];
    [Parse setApplicationId:@"pYVHYPd6vO4f3cVY7qv5xgu3z1Ov9sKa5CJ0W2QR" clientKey:@"dEYW7a8feCoXE09r6cmjYrKpNBq2YrfXdsY0Drw8"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self reloadData:NO];
    
    // SaveData
    NSUserDefaults *storage = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.mogames.AppReviewTimes"];
    
    self.updateLabel.text = [NSString stringWithFormat:@"Last update: %@",[storage objectForKey:@"updatedOn"]];
    self.iosLabel.text = [NSString stringWithFormat:@"%ld days", (long)[[storage objectForKey:@"iosDays"] integerValue]];
    self.macLabel.text = [NSString stringWithFormat:@"%ld days", (long)[[storage objectForKey:@"macDays"] integerValue]];
}

- (void)reloadData:(BOOL)localStore {
    
    PFQuery *query = [PFQuery queryWithClassName:@"reviewtimes"];
    [query orderByDescending:@"createdAt"];
    [query setLimit:1];
    
    if (localStore) {
        [query fromLocalDatastore];
    }
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        if (error) {
            if (!localStore) {
                [self reloadData:YES];
            }
            
        } else {
            
            self.updateLabel.text = [NSString stringWithFormat:@"Last update: %@",[object.updatedAt timeAgo]];
            self.iosLabel.text = [NSString stringWithFormat:@"%ld days", (long)[[object objectForKey:@"ios_days"] integerValue]];
            self.macLabel.text = [NSString stringWithFormat:@"%ld days", (long)[[object objectForKey:@"mac_days"] integerValue]];
            
            // SaveData
            NSUserDefaults *storage = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.mogames.AppReviewTimes"];
            [storage setObject:[object objectForKey:@"ios_days"] forKey:@"iosDays"];
            [storage setObject:[object objectForKey:@"mac_days"] forKey:@"macDays"];
            [storage setObject:[object.updatedAt timeAgo] forKey:@"updatedOn"];
            [storage synchronize];
            
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)margins
{
    margins.bottom = 10.0;
    return margins;
}
- (IBAction)openApp:(id)sender {
    NSURL *pjURL = [NSURL URLWithString:@"AppReviewTimes://home"];
    [self.extensionContext openURL:pjURL completionHandler:nil];
}
@end
