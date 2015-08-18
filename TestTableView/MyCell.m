//
//  myCell.m
//  TestTableView
//
//  Created by TWer  on 8/18/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(270, 10, 40, 20)];
//        self.detailTextLabel=[[ui]]
        [self addSubview:self.nameLabel];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
