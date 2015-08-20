//
//  Service.m
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "Service.h"

@implementation Service
-(NSMutableArray*)readJson:(NSString*)file
{
    return [ReadJson localfileWithContentsOfJSONString:file];
}

-(NSMutableArray*)urlJson:(NSString*)url
{
    return [UrlJsonfile netfileWithContentsOfJSONString:url];
}
@end
