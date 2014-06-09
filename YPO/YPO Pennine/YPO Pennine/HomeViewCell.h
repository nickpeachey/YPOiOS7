//
//  HomeViewCell.h
//  YPO Pennine
//
//  Created by Nick Peachey on 09/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UIImageView *cellImageView;
@property (nonatomic, retain) IBOutlet UITextView *cellDescription;

@end
