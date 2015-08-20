//
//  UrlJsonfile.h
//  TestTableView
//
//  Created by TWer  on 8/20/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlJsonfile : NSObject

+(NSMutableArray*)netfileWithContentsOfJSONString:(NSString*)jsonurl;

@end
