//
//  DLRequestManager.h
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLRequestManager : NSObject

/// 请求类
@property (nonatomic, strong, readonly) AFHTTPSessionManager *sessionManager;

+ (instancetype)shared;
/// 请求地址
- (void)setupBaseUrl:(NSURL *)baseUrl;
/// 请求头
- (void)setupCustomHTTPHeaderInfo:(NSDictionary *)headerInfo;
/// 请求类型
- (void)setupCustomAcceptableContentTypes:(NSSet *)contentTypes;

@end

NS_ASSUME_NONNULL_END
