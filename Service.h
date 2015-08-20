//
//  Service.h
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadJsonfile.h"
#import "UrlJsonfile.h"
@interface Service : NSObject
-(NSMutableArray*)readJson:(NSString*)file;
-(NSMutableArray*)urlJson:(NSString*)url;
@end
