//
//  DLRequestManager.h
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLRequestManager : AFHTTPSessionManager

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
