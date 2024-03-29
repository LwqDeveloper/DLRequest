//
//  DLRequestLog.m
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import "DLRequestLog.h"

@interface DLRequestLog ()

/// queue
@property (nonatomic, strong) dispatch_queue_t queue;
/// 日志
@property (nonatomic, strong) NSMutableArray *requestDatas;

@end

@implementation DLRequestLog

+ (instancetype)shared {
    static DLRequestLog *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DLRequestLog alloc] init];
    });
    return sharedInstance;
}

- (void)recordLogModel:(DLRequestLogModel *)model {
    if (!model) return;
    if (!self.isRecordLog) return;
    
    dispatch_barrier_async(self.queue, ^{
        [self.requestDatas addObject:model];
    });
}

- (NSArray *)datas {
    return self.requestDatas.copy;
}

- (dispatch_queue_t)queue {
    if (!_queue) {
        _queue = dispatch_queue_create("write_queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return _queue;
}

@end

@implementation DLRequestLogModel

+ (instancetype)modelWithMethod:(NSString *)method path:(nonnull NSString *)path {
    DLRequestLogModel *model = [DLRequestLogModel new];
    model.method = method;
    model.path = path;
    return model;
}

- (instancetype)init {
    if (self = [super init]) {
        self.recordDate = [NSDate date];
    }
    return self;
}

- (void)setTask:(NSURLSessionTask *)task params:(NSDictionary * _Nullable)params obj:(nonnull id)obj {
    self.task = task;
    self.responseObject = obj;
    self.params = params;
    self.expendTime = [[NSDate date] timeIntervalSinceDate:self.recordDate];
}

- (void)setTask:(NSURLSessionTask *)task params:(NSDictionary * _Nullable)params err:(nonnull NSError *)err {
    self.task = task;
    self.error = err;
    self.params = params;
    self.expendTime = [[NSDate date] timeIntervalSinceDate:self.recordDate];
}

@end
