//
//  EntrysOperator.h
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntrysOperator : NSObject

+ (NSString *)jsonStringFromNSObject:(id)obj;
+ (NSData *)jsonDataFromNSObject:(id)obj;

+ (id)objFromString:(NSString *)jsonString;
+ (id)dictFromJsonString:(NSString *)jsonString;
+ (id)dictFromJson:(NSData *)jsonData;

@end
