//
//  CallHistoryMapping.h
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CallHistory.h"

@interface CallHistoryMapping : NSObject
-(CallHistoryMapping*)initWithPhoneNumber:(NSString*) phoneNumber And:(NSString*) callFrom And:(NSString*) callTime;
-(NSMutableArray*)mappingCallHistoryArray:(NSArray*)callHistoryArray;
-(CallHistory*) mappingCallHistory:(NSDictionary*)callHistoryData;
@end
