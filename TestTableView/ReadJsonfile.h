//
//  DicforJson.h
//  TestTableView
//
//  Created by TWer  on 8/19/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadJson : NSObject
+(NSMutableArray*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation;
+(void)deleteWithContentsOfJSONString:(NSString*)fileLocation Index:(NSUInteger) index;
@end
