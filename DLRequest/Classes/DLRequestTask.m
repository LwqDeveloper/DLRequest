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
+ (void)getConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath params:(NSDictionary * __nullable)params {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"GET"];
    [[DLRequestManager shared].sessionManager GET:urlPath parameters:params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task params:params obj:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task params:params err:error];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
}

//**********************************************  POST  请求  **********************************************//
+ (void)postConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath params:(NSDictionary * __nullable)params {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"POST"];
    [[DLRequestManager shared].sessionManager POST:urlPath parameters:params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task params:params obj:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task params:params err:error];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
}

//**********************************************  PUT  请求  **********************************************//
+ (void)putConnection:(DLRequestSuccBlock)success fail:(nonnull DLRequestFailBlock)fail urlPath:(nonnull NSString *)urlPath params:(NSDictionary * _Nullable)params {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"PUT"];
    [[DLRequestManager shared].sessionManager PUT:urlPath parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task params:params obj:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task params:params err:error];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
}

//**********************************************  DELETE  请求  **********************************************//
+ (void)deleteConnection:(DLRequestSuccBlock)success fail:(DLRequestFailBlock)fail urlPath:(NSString *)urlPath params:(NSDictionary * __nullable)params {
    DLRequestLogModel *logModel = [DLRequestLogModel modelWithMethod:@"DELETE"];
    [[DLRequestManager shared].sessionManager DELETE:urlPath parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(task, responseObject);
        [logModel setTask:task params:params obj:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) fail(task, error);
        [logModel setTask:task params:params err:error];
    }];
    [[DLRequestLog shared] recordLogModel:logModel];
}

@end
