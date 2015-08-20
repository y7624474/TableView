//
//  UrlJsonfile.m
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "UrlJsonfile.h"

@implementation UrlJsonfile

+(NSMutableArray*)netfileWithContentsOfJSONString:(NSString*)jsonurl
{
    NSURL *url = [NSURL URLWithString:jsonurl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval:60.0f];
    NSError *error = [NSError new];
    NSURLResponse *response = [NSURLResponse new];
    
    NSData *responeData = [NSURLConnection sendSynchronousRequest:request
                                                returningResponse:&response
                                                            error:&error];
    NSString *newText = [[NSString alloc]
                         initWithData:responeData
                         encoding:NSUTF8StringEncoding];
    NSLog(@"%@",newText);
    NSMutableArray *jsonToDictionary = [NSJSONSerialization JSONObjectWithData:responeData
                                                                     options:0
                                                                       error:&error];
    
    return [NSMutableArray arrayWithArray:jsonToDictionary];
}
@end
