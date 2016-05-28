//
//  H5BridgeiOSAlert.m
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "H5BridgeiOSAlert.h"

@implementation H5BridgeiOSAlert

- (void)checkParams:(NSDictionary *)params {
    if(![params isKindOfClass:[NSDictionary class]])
    {
        NSLog(@"Error: params type Error:%@",params);
        [self callBackWithResponseWithErrorCode:H5BridgeiOSErrorCodeParams message:@"参数类型错误"];
        self.finishCallback(self,NO);
        return;
    }
    
    if (![params[@"msg"] isKindOfClass:[NSString class]]) {
        NSLog(@"Error: params msg Error:%@",params);
        [self callBackWithResponseWithErrorCode:H5BridgeiOSErrorCodeParams message:@"参数msg类型错误"];
        self.finishCallback(self,NO);
        return;
    }
    
    if ([params[@"msg"] length] == 0) {
        NSLog(@"Warn: params msg empty:%@",params);
    }
}

- (void)showInfo {

}

- (void)showAlert {
    NSDictionary *params = [self getParams];
    [self checkParams:params];
    
    NSString *msg = params[@"msg"];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:msg message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okBtn];
    UIViewController *VC = [[UIViewController alloc] init];
    [VC presentViewController:alertController animated:YES completion:nil];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = VC;
    [window makeKeyAndVisible];
    
    [self callBackWithResponse];
    self.finishCallback(self,YES);

}

@end
