
#import "ViewController.h"


@interface ViewController ()
{
    NSMutableArray *information;
    Service *service;
    LableMod *lableinfo;
}
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    service=[Service new];
    [self lableInit];
//    information= [service readJson:@"call.json"];
    information=[service urlJson:@"http://www.aliexprice.com/callhistory.index"];
    CGRect frame=CGRectMake(8, 30, 350, 500);
    self.callTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.callTableView.dataSource = self;
    self.callTableView.delegate = self;
    [self.view addSubview:self.callTableView];

}

-(void)lableInit
{
    lableinfo=[LableMod new];
    lableinfo.strtel=@"phonenumber";
    lableinfo.strfrom=@"location";
    lableinfo.strtime=@"calltime";
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

    cell.textLabel.text = [[information valueForKey:lableinfo.strtel] objectAtIndex:row];
    cell.detailTextLabel.text = [[information valueForKey:lableinfo.strfrom] objectAtIndex:row];
    cell.timeLabel.text=[[information valueForKey:lableinfo.strtime] objectAtIndex:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [information removeObjectAtIndex:indexPath.row];
    [self.callTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [information count];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
