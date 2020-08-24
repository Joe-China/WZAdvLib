//
//  AdvApplication.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "AdvApplication.h"
#import "INetHttp.h"
#import "IKvdb.h"



@implementation AdvApplication{
    id<INetHttp>  mNetHttp;
    NSDictionary *mOption;
    id<IKvdb> mKvdb;
}

static AdvApplication *sInstance = nil;

+(instancetype)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];
    });
    return sInstance;
}


- (void)init:(id<INetHttp>)netHttp andKvdb:(id<IKvdb>)kvdb  option:(nullable NSDictionary *)opt{
            mNetHttp = netHttp;
            mKvdb = kvdb;
            mOption = opt;
}



- (void)createAdView:(NSString *)pagekey posKey:(NSString *)poskey  view:(UIView *)view option:(nullable NSDictionary *)opt{





}


@end
