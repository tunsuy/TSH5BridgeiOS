//
//  H5BridgeiOS.h
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "H5BridgeiOSBuilder.h"

typedef void (^bridgeBlock)(H5BridgeiOSBuilder *builder);
typedef void (^H5BridgeiOSFinishCallback)(H5BridgeiOS *H5BridgeiOS, BOOL finish);

@interface H5BridgeiOS : NSObject

@property (nonatomic, weak, readonly) H5BridgeiOSFinishCallback finishCallback;

@property (nonatomic, copy) NSDictionary *requestDic;
@property (nonatomic, strong) UIView *webView;

@property (nonatomic, copy) NSDictionary *operationDic;

@property (nonatomic, strong) NSMutableDictionary *responseDic;

- (id)createWithBuilder:(bridgeBlock)block;
- (NSDictionary *)getParams;
- (void)callBackWithResponse;
- (void)callBackWithResponseWithErrorCode:(NSInteger)code message:(NSString *)msg;
- (void)callBackWithResponseWithError:(NSString *)errorStr;

@end
