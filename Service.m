//
//  Service.m
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "Service.h"
#import "CallHistoryMapping.h"

@implementation Service


-(NSMutableArray*)readJson:(NSString*)file
{
    ReadJson *readJson = [ReadJson new];
    readJson.callHistoryMapping = [[CallHistoryMapping alloc]initWithPhoneNumber:@"tel" And:@"from" And:@"time"];
    return [readJson localfileWithContentsOfJSONString:file];
}

-(void)urlJson:(NSString*)url AsynBack:(Asyn) asynback
{
    [[UrlJsonfile new] netfileWithContentsOfJSONString:url AsynBack:asynback];
}

@end

