//
//  DicforJson.m
//  TestTableView
//
//  Created by TWer  on 8/19/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "ReadJsonfile.h"

@implementation ReadJson
+(NSMutableArray*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSMutableArray *array=[NSMutableArray arrayWithArray:result];
    return array;
}

+(void)deleteWithContentsOfJSONString:(NSString*)fileLocation Index:(NSUInteger) index{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];

    NSMutableArray *array=[NSMutableArray arrayWithArray:result];
    [array removeObjectAtIndex:index];
    [array writeToFile:filePath atomically:YES];
}
@end
