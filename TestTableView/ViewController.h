//
//  ViewController.h
//  TestTableView
//
//  Created by TWer  on 8/18/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) NSMutableArray *dataList;
@property (nonatomic) UITableView *callTableView;

@end

