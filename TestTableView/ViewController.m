//
//  ViewController.m
//  TestTableView
//
//  Created by TWer  on 8/18/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "ViewController.h"
#import "TimeCell.h"

@interface ViewController ()
{
    NSMutableArray *information;
    Service *service;
}
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    service=[Service new];
    information= [service readJson:@"call.json"];
    
    CGRect frame=CGRectMake(8, 30, 350, 500);
    self.callTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.callTableView.dataSource = self;
    self.callTableView.delegate = self;
    [self.view addSubview:self.callTableView];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    TimeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil) {
        cell = [[TimeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    NSUInteger row = [indexPath row];

    cell.textLabel.text = [[information valueForKey:@"tel"] objectAtIndex:row];
    cell.detailTextLabel.text = [[information valueForKey:@"from"] objectAtIndex:row];
    cell.nameLabel.text=[[information valueForKey:@"time"] objectAtIndex:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [DicforJson deleteWithContentsOfJSONString:@"call.json" Index:[indexPath row]];
    [information removeObjectAtIndex:indexPath.row];
    [self.callTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [information count];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
