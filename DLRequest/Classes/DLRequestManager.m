//
//  DLRequestManager.m
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import "DLRequestManager.h"

@interface DLRequestManager ()

/// 请求类
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation DLRequestManager

+ (instancetype)shared {
    static DLRequestManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DLRequestManager alloc] init];
    });
    return instance;
}

/// 请求地址
- (void)setupBaseUrl:(NSURL *)baseUrl {
    if (!baseUrl)   NSAssert(NO, @"baseUrl 不能为nil");
    
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
    
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/plain", @"text/javascript", @"text/json", @"application/gzip", nil];
}

/// 请求头
- (void)setupCustomHTTPHeaderInfo:(NSDictionary *)headerInfo {
    for (NSString *key in headerInfo) {
        [self.sessionManager.requestSerializer setValue:headerInfo[key] forHTTPHeaderField:key];
    }
}

/// 请求类型
- (void)setupCustomAcceptableContentTypes:(NSSet *)contentTypes {
    self.sessionManager.responseSerializer.acceptableContentTypes = contentTypes;
}

@end
