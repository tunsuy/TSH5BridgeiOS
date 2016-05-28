//
//  H5BridgeiOS.m
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "H5BridgeiOS.h"

@interface H5BridgeiOS ()

@property (nonatomic, weak, readwrite) H5BridgeiOSFinishCallback finishCallback;

@end

@implementation H5BridgeiOS

- (id)createWithBuilder:(bridgeBlock)block {
    H5BridgeiOSBuilder *builder = [[H5BridgeiOSBuilder alloc] init];
    block(builder);
    return [builder build];
}

- (void)dealH5BIOperatorWithFinishCallback:(H5BridgeiOSFinishCallback)finishCallback {
    self.finishCallback = finishCallback;
    
    SEL operateSel = NSSelectorFromString(self.operationDic[@"selector"]);
    if ([self respondsToSelector:operateSel]) {
        [self respondsToSelector:operateSel];
    }
    else {
        NSLog(@"Error: 无法识别的请求-%@", self.operationDic[@"seletor"]);
        self.finishCallback(self, NO);
    }
}

- (void)setRequestDic:(NSDictionary *)requestDic {
    _requestDic = requestDic;
    [self defaultResponseData];
}

- (NSDictionary *)getParams {
    return self.requestDic[kH5BI_Params];
}

- (void)defaultResponseData {
    if (!_responseDic) {
        _responseDic = [NSMutableDictionary dictionary];
    }
    
    //设置response默认值
    _responseDic[@"success"] = @(YES);
    _responseDic[@"msg"] = @"";
    if (self.requestDic[kH5BI_CallBack_ID]) {
        _responseDic[kH5BI_CallBack_ID] = self.requestDic[kH5BI_CallBack_ID];
    }
    if (self.requestDic[kH5BI_Msg_Type]) {
        _responseDic[kH5BI_Msg_Type] = self.requestDic[kH5BI_Msg_Type];
    }
}

- (void)callBackWithResponse {
    if (self.responseDic) {
        NSString *responseStr = [EntrysOperator jsonStringFromNSObject:self.responseDic];
        [_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:kH5BIJS_Fetch_Response(responseStr) waitUntilDone:NO];
    }
}

- (void)callBackWithResponseWithErrorCode:(NSInteger)code message:(NSString *)msg {
    _responseDic[@"success"] = @(NO);
    if (code) {
        _responseDic[@"errCode"] = @(code);
    }
    
    if (msg) {
        _responseDic[@"msg"] = [NSString stringWithFormat:@"%@:%ld",msg,code];
    }
    
    [self callBackWithResponse];
}

- (void)callBackWithResponseWithError:(NSString *)errorStr {
    _responseDic[@"success"] = @(NO);
    if (errorStr) {
        _responseDic[@"errCode"] = @(H5BridgeiOSErrorCodeUnknow);
        _responseDic[@"msg"] = errorStr;
    }
    [self callBackWithResponse];
}

//- (UIViewController *)getNextResponse
//{
//    return [self.webView getNextResponder:[UIViewController class]];
//}

@end
