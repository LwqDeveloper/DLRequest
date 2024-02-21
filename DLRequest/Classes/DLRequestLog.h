//
//  DLRequestLog.h
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@class DLRequestLogModel;
@interface DLRequestLog : NSObject

/// 日志
@property (nonatomic, strong) NSArray *datas;
/// 是否开启记录
@property (nonatomic, assign) BOOL isRecordLog;

+ (instancetype)shared;

- (void)recordLogModel:(DLRequestLogModel *)model;

@end

@interface DLRequestLogModel : NSObject

/// task
@property (nonatomic, strong) NSURLSessionTask *task;
/// path
@property (nonatomic, strong) NSString *path;
/// 参数
@property (nonatomic, strong) NSDictionary *params;
/// res
@property (nonatomic, strong) id responseObject;
/// err
@property (nonatomic, strong) NSError *error;
/// 记录时间
@property (nonatomic, strong) NSDate *recordDate;
/// 耗时
@property (nonatomic, assign) float expendTime;
/// 请求方式
@property (nonatomic, strong) NSString *method;

+ (instancetype)modelWithMethod:(NSString *)method path:(NSString *)path;

- (void)setTask:(NSURLSessionTask *)task params:(NSDictionary * __nullable)params obj:(id)obj;
- (void)setTask:(NSURLSessionTask *)task params:(NSDictionary * __nullable)params err:(NSError *)err;

@end

NS_ASSUME_NONNULL_END
