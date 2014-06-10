//
//  HomeViewController.m
//  YPO Pennine
//
//  Created by Nick Peachey on 09/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewCell.h"
#import "MenuOption.h"

#define kHomeCellIdentifier @"Home Cell"

@interface HomeViewController()

-(void)loadData:(BOOL)forRefresh;

@end

@implementation HomeViewController

-(void)loadData:(BOOL)forRefresh
{
    if(forRefresh) {
        [self.refreshControl beginRefreshing];
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"MenuOption"];
    query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSArray *result = [query findObjects];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.menuOptions = result;
            if(forRefresh) {
                [self.refreshControl endRefreshing];
            }
            [self.tableView reloadData];
        });
    });
}

-(void)prepareRefreshControl
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(requestRefresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

-(void)requestRefresh
{
    [self loadData:YES];
}

-(void)viewDidLoad
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:1.0]];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self prepareRefreshControl];
    [self loadData:NO];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuOptions count] * 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 1) {
    return 100;
    }
    else {
        return 5;
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    static NSString *cellIdentifier = @"Home Cell";
    if (row % 2 == 1) {

        HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        MenuOption *menuOption = [self.menuOptions objectAtIndex:row / 2];
        
        cell.titleLabel.text = menuOption.name;
        cell.cellDescription.text = menuOption.cellDescription;
        
        dispatch_queue_t downloadQueue = dispatch_queue_create("imagequeue", NULL);
        
        dispatch_async(downloadQueue, ^{
            NSURL *imageUrl = [NSURL URLWithString:[menuOption.image valueForKey:@"url"]];
            NSData *imageUrlData = [NSData dataWithContentsOfURL:imageUrl];
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [UIImage imageWithData:imageUrlData];
                cell.cellImageView.image = image;
            });
        });
        
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

@end
