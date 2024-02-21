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
+ (void)getConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath params:(NSDictionary * __nullable)params;

//**********************************************  POST  请求  **********************************************//
+ (void)postConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath params:(NSDictionary * __nullable)params;

//**********************************************  PUT  请求  **********************************************//
+ (void)putConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath params:(NSDictionary * __nullable)params;

//**********************************************  DELETE  请求  **********************************************//
+ (void)deleteConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath params:(NSDictionary * __nullable)params;

@end

NS_ASSUME_NONNULL_END
