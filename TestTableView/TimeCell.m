//
//  myCell.m
//  TestTableView
//
//  Created by TWer  on 8/18/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "TimeCell.h"

@implementation TimeCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(270, 10, 80, 20)];
        [self addSubview:self.timeLabel];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
