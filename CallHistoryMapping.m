//
//  CallHistoryMapping.m
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "CallHistoryMapping.h"

@interface CallHistoryMapping (){
@private NSString* _phoneNumber;
@private NSString* _callFrom;
@private NSString* _callTime;
}
@end
@implementation CallHistoryMapping

-(CallHistoryMapping*)initWithPhoneNumber:(NSString*) phoneNumber And:(NSString*) callFrom And:(NSString*) callTime{
    if ((self = [super init])) {
        _phoneNumber = phoneNumber;
        _callFrom = callFrom;
        _callTime = callTime;
    }
    return self;
}

-(CallHistory *)mappingCallHistory:(NSDictionary *)callHistoryData{
    CallHistory *callHistory = [CallHistory new];
    callHistory.phonenumber = [callHistoryData objectForKey:_phoneNumber];
    callHistory.callform = [callHistoryData objectForKey:_callFrom];
    callHistory.calltime = [callHistoryData objectForKey:_callTime];
    return callHistory;
}

-(NSMutableArray *)mappingCallHistoryArray:(NSArray *)callHistoryArray{
    NSMutableArray *array= [[NSMutableArray alloc]init];
    [callHistoryArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CallHistory *callHistory = [self mappingCallHistory:obj];
        [array addObject:callHistory];
    }];
    return array;
}
@end
