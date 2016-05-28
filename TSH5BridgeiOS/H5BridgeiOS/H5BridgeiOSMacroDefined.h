//
//  H5BridgeiOSMacroDefined.h
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#ifndef H5BridgeiOSMacroDefined_h
#define H5BridgeiOSMacroDefined_h

/** 错误类型定义 */
#define kH5BI_Error_Event_NotFound   @"未找到此方法"
#define kH5BI_Error_NetFailed        @"网络错误"
#define kH5BI_Error_Params           @"参数错误"
#define kH5BI_Error_NoPermission     @"没有权限"
#define kH5BI_Error_Unknow           @"未知错误"


//自定义url Scheme 规则
#define kH5BIJS_Dispatch_Message @"TS://dispatch_message/"

#define kH5BIJS_Fetch_Request @"TSJSBridge._fetchQueue()"

#define kH5BIJS_Fetch_Response(response) [NSString stringWithFormat:@"TSJSBridge._handleMessageFromApp(%@);",response]

//request
#define kH5BI_Func @"func"

//event
#define kH5BI_EventName @"__eventname"

// event /response / request 共有
#define kH5BI_CallBack_ID @"__callback_id"

#define kH5BI_Msg_Type @"__msg_type"
#define kH5BI_Msg_Type_Invoke @"invoke"
#define kH5BI_Msg_Type_Event @"event"

#define kH5BI_Params @"params"

typedef NS_ENUM(NSInteger, H5BridgeiOSErrorCode) {
    H5BridgeiOSErrorCodeEventNotFound = 0,
    H5BridgeiOSErrorCodeNetFailed,
    H5BridgeiOSErrorCodeParams,
    H5BridgeiOSErrorCodeNoPermission,
    H5BridgeiOSErrorCodeUnknow
};

/** 本地原生组件名 */
#define kH5BridgeiOSAlert           @"H5BridgeiOSAlert"
#define kH5BridgeiOSUnknow          @"H5BridgeiOSUnknow"


#endif /* H5BridgeiOSMacroDefined_h */
