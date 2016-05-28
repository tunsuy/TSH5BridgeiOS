//
//  H5BridgeiOSBuilder.m
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "H5BridgeiOSBuilder.h"
#import "H5BridgeiOS.h"

@interface H5BridgeiOSBuilder ()

@property (nonatomic, copy) NSDictionary *operationDic;

@end

@implementation H5BridgeiOSBuilder

- (instancetype)init {
    if (self = [super init]) {
        
        /** 
         *  key: web端JS定义的方法名称
         *  value: iOS本地端与之对应的组件类和对应方法
         */
        _operationDic = @{
                          /** H5BridgeiOSAlert */
                          @"showInfo":@{@"class":kH5BridgeiOSAlert,@"selector":@"showInfo"},
                          @"showAlert":@{@"class":kH5BridgeiOSAlert,@"selector":@"showAlert"},
                          @"showLoading":@{@"class":kH5BridgeiOSAlert,@"selector":@"showLoading"},
                          @"hideLoading":@{@"class":kH5BridgeiOSAlert,@"selector":@"hideLoading"},
                          @"showConfirm":@{@"class":kH5BridgeiOSAlert,@"selector":@"showConfirm"},
                          @"showActionSheet":@{@"class":kH5BridgeiOSAlert,@"selector":@"showActionSheet"},
                          };
        
    }
    return self;
}

- (id)build {
    if (!self.requestDic[kH5BI_Func]) {
        NSLog(@"Eroor: 数据格式不正确: %@", self.requestDic);
        return nil;
    }
    NSDictionary *operation = self.operationDic[self.requestDic[kH5BI_Func]];
    NSString *operationClassName;
    if (!operation) {
        operationClassName = kH5BridgeiOSUnknow;
    }
    operationClassName = operation[@"class"];
    Class operationClass = NSClassFromString(operationClassName);
    id operationObj = [[operationClass alloc] init];
    [operationObj setOperationDic:[operation copy]];
    [operationObj setRequestDic:self.requestDic];
    [operationObj setWebView:self.webView];
    
    return operationObj;
}

@end

