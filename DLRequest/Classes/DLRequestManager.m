//
//  DLRequestManager.m
//  Pods
//
//  Created by Muyang on 2024/2/21.
//

#import "DLRequestManager.h"

@implementation DLRequestManager

+ (instancetype)shared {
    static DLRequestManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DLRequestManager alloc] init];
    });
    return instance;
}

@end
