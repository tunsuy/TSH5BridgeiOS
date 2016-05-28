//
//  H5BridgeiOSBuilder.h
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class H5BridgeiOS;

@interface H5BridgeiOSBuilder : NSObject

@property (nonatomic, copy) NSDictionary *requestDic;
@property (nonatomic, strong) UIWebView *webView;

- (id)build;

@end
