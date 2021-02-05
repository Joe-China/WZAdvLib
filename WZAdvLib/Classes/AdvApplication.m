//
//  AdvApplication.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "AdvApplication.h"

#import "IKvdb.h"



@implementation AdvApplication{
    NSDictionary *mOption;
}

static AdvApplication *sInstance = nil;

+(instancetype)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];
    });
    return sInstance;
}


//初始化
- (void)init:(id<INetHttp>)netHttp andKvdb:(id<IKvdb>)kvdb  option:(nullable NSDictionary *)opt{
        mOption = opt;
        [[AdvServerApi getInstance] init:netHttp andKvdb:kvdb];
}

//通过key 创建view 及数据
- (void)createAdView:(NSString *)pagekey posKey:(NSString *)poskey  view:(UIView *)view option:(nullable NSDictionary *)opt{
        
       [[AdvControlApp getInstance] createAdView:pagekey posKey:poskey view:view option:opt];
}

@end
