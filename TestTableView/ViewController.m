//
//  ViewController.m
//  TestTableView
//
//  Created by TWer  on 8/18/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"13609224546",@"13623376546",@"13666676546",@"1360987997",@"13609876546",@"13609843340",@"13609876546",@"13609871234",@"13609870958", nil];
    
    self.dataList = list;
    CGRect frame=CGRectMake(8, 30, 350, 500);
    self.callTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];

    self.callTableView.dataSource = self;

    self.callTableView.delegate = self;

    [self.view addSubview:self.callTableView];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil) {
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.dataList objectAtIndex:row];
    cell.detailTextLabel.text = @"来源";
    cell.nameLabel.text=@"2015";
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"执行删除操作");
    NSUInteger row=[indexPath row];
    [self.dataList removeObjectAtIndex:row];
    [self.callTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection: (NSInteger) section {
    return self.dataList.count;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
