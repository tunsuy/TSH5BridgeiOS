//
//  ViewController.m
//  TSH5BridgeiOS
//
//  Created by tunsuy on 4/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "ViewController.h"
#import "H5BridgeiOS.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //test
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"http://svr.kd77.cn/demo"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    _webView.delegate = self;
    [self.view addSubview:self.webView];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = request.URL;
    if ([url.absoluteString isEqualToString:kH5BIJS_Fetch_Request]) {
        NSString *requestQueueStr = [webView stringByEvaluatingJavaScriptFromString:kH5BIJS_Fetch_Request];
        NSArray *requestQueue = [EntrysOperator objFromString:requestQueueStr];
        for (NSString * requestStr in requestQueue) {
            //创建新的js操作
            H5BridgeiOS *operator = [[H5BridgeiOS alloc] createWithBuilder:^(H5BridgeiOSBuilder *builder){
                builder.webView = webView;
                builder.requestDic = [EntrysOperator dictFromJsonString:requestStr];
            }];
            
            //创建失败直接返回
            if (!operator) {
                return NO;
            }
            
//            [currentOprs addObject:operator];
//            
//            __weak typeof(currentOprs) weakCurrentOprs = currentOprs;
//            [operator dealJSOperator:^(LAPJSBridge *dealOper, BOOL finish) {
//                //js处理完成后从currentOprs中清楚
//                if (finish) {
//                    [weakCurrentOprs removeObject:dealOper];
//                }
//            }];
        }
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
