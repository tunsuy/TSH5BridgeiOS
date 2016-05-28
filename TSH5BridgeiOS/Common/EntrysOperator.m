//
//  EntrysOperator.m
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "EntrysOperator.h"

@implementation EntrysOperator

+ (NSString *)jsonStringFromNSObject:(id)obj {
    NSData *data = [self jsonDataFromNSObject:obj];
    if (data) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return @"{}";
}

+ (NSData *)jsonDataFromNSObject:(id)obj {
    if (! obj || [obj isEqual:[NSNull null]]) {
        return nil;
    }
    NSError *error = nil;
    if (! [NSJSONSerialization isValidJSONObject:obj]) {
        NSLog(@"Bug: jsonFromNSObject arg error:%@", obj);//NSNumber 不可做 key, 不能包含 NSDate
        return nil;
    }
    NSData *jsonObject = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    
    if (! jsonObject) {
        NSLog(@"Warn: jsonFromNSObject failed:%@", error);
    }
    return jsonObject;
}


+ (id)objFromString:(NSString *)jsonString {
    id result = [self dictFromJsonString:jsonString];
    if (! result) {
        result = jsonString;
    }
    return result;
}

+ (id)dictFromJsonString:(NSString *)jsonString {
    if (! [jsonString isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [self dictFromJson:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
}

+ (id)dictFromJson:(NSData *)jsonData {
    if (! jsonData) {
        return nil;
    }
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    if (jsonObject != nil &&
        error == nil){
        
    }else if (error != nil){
        NSLog(@"Warn: happened while deserializing the JSON data:%@ \n from:%@", error, [NSString stringWithUTF8String:(const char *)[jsonData bytes]]);
        return nil;
    }
    return jsonObject;
}

@end
