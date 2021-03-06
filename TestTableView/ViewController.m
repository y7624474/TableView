
#import "ViewController.h"


@interface ViewController ()
{
    NSMutableArray *information;
    Service *service;
    UIActivityIndicatorView *activityIndicator;
}
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    service=[Service new];
    information= [service readJson:LOCAL];
    
    [self initView];

}
-(void)initView{
    
    CGRect frame=CGRectMake(8, 65, 350, 500);
    self.callTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.callTableView.dataSource = self;
    self.callTableView.delegate = self;
    
    CGRect swichframe=CGRectMake(250, 30, 50, 25);
    self.switchbtn=[[UISwitch alloc] initWithFrame:swichframe];
    [self.switchbtn addTarget: self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    activityIndicator = [[UIActivityIndicatorView alloc]
                         initWithActivityIndicatorStyle:
                         UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.color = [UIColor blackColor];
    activityIndicator.center =self.view.center;
    
    [self.view addSubview:self.switchbtn];
    [self.view addSubview:self.callTableView];
    [self.view addSubview:activityIndicator];

   
}

- (void) switchValueChanged:(id)sender{
    [information removeAllObjects];
    if (!self.switchbtn.on) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityIndicator stopAnimating];
        });
        information= [service readJson:LOCAL];
    }
    else{
        [activityIndicator startAnimating];
        
        [service urlJson:URL
                            AsynBack:^(NSURLResponse *response, NSData *data, NSError *error){
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    [activityIndicator stopAnimating];
                                });
                                if (error) {
                                    NSLog(@"Httperror:%@", error.localizedDescription);
                                }else{
                                    __autoreleasing NSError* error = nil;
                                    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                                    
                                    CallHistoryMapping *_callHistoryMapping = [[CallHistoryMapping alloc]initWithPhoneNumber:@"phonenumber" And:@"location" And:@"calltime"];
                                    
                                    information=[_callHistoryMapping mappingCallHistoryArray:result];
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [self.callTableView reloadData];
                                    });
                                }
                            }
                     ];
    }
     [self.callTableView reloadData];
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

    CallHistory *callHistory = (CallHistory*)[information objectAtIndex:row];
    
    cell.textLabel.text = callHistory.phonenumber;
    cell.detailTextLabel.text = callHistory.callform;
    cell.timeLabel.text = callHistory.calltime;
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
