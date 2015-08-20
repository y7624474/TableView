//
//  UrlJsonfile.m
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "UrlJsonfile.h"

@implementation UrlJsonfile

-(void)netfileWithContentsOfJSONString:(NSString*)jsonurl AsynBack:(Asyn) asynback
{
    NSURL *url = [NSURL URLWithString:jsonurl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval:60.0f];
//    NSError *error = [NSError new];
//    NSURLResponse *response = [NSURLResponse new];
//    
//    NSData *responeData = [NSURLConnection sendSynchronousRequest:request
//                                                returningResponse:&response
//                                                            error:&error];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:asynback];
}


@end
