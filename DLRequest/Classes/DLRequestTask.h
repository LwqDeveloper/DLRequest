//
//  DLRequestTask.h
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DLRequestSuccBlock)(NSURLSessionDataTask *task, id body);
typedef void(^DLRequestFailBlock)(NSURLSessionDataTask *task, NSError *error);

@interface DLRequestTask : NSObject

//**********************************************  GET  请求  **********************************************//
+ (NSURLSessionDataTask *)getConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary * __nullable)parameters;

//**********************************************  POST  请求  **********************************************//
+ (NSURLSessionDataTask *)postConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary * __nullable)parameters;

//**********************************************  PUT  请求  **********************************************//
+ (NSURLSessionDataTask *)putConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary *)parameters;

//**********************************************  DELETE  请求  **********************************************//
+ (NSURLSessionDataTask *)deleteConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary * __nullable)parameters;

@end

NS_ASSUME_NONNULL_END
