//
//  DLRequestTask.m
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import "DLRequestTask.h"
#import "DLRequestManager.h"
#import "DLRequestLog.h"

@implementation DLRequestTask

//**********************************************  GET  请求  **********************************************//
+ (NSURLSessionDataTask *)getConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary * __nullable)parameters {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"GET"];
    NSURLSessionDataTask *task = [[DLRequestManager shared].sessionManager GET:urlPath parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task obj:responseObject];
        [logModel setupExpendTime];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task err:error];
        [logModel setupExpendTime];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
    return task;
}

//**********************************************  POST  请求  **********************************************//
+ (NSURLSessionDataTask *)postConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary * __nullable)parameters {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"POST"];
    NSURLSessionDataTask *task = [[DLRequestManager shared].sessionManager POST:urlPath parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task obj:responseObject];
        [logModel setupExpendTime];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task err:error];
        [logModel setupExpendTime];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
    return task;
}

//**********************************************  PUT  请求  **********************************************//
+ (NSURLSessionDataTask *)putConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary *)parameters {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"PUT"];
    NSURLSessionDataTask *task = [[DLRequestManager shared].sessionManager PUT:urlPath parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task obj:responseObject];
        [logModel setupExpendTime];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task err:error];
        [logModel setupExpendTime];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
    return task;
}

//**********************************************  DELETE  请求  **********************************************//
+ (NSURLSessionDataTask *)deleteConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath parameters:(NSDictionary * __nullable)parameters {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"DELETE"];
    NSURLSessionDataTask *task = [[DLRequestManager shared].sessionManager DELETE:urlPath parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task obj:responseObject];
        [logModel setupExpendTime];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task err:error];
        [logModel setupExpendTime];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
    return task;
}

@end
