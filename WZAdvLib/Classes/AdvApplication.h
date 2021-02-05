//
//  AdvApplication.h
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdvServerApi.h"
#import "INetHttp.h"
#import "AdvControlApp.h"
NS_ASSUME_NONNULL_BEGIN

@interface AdvApplication : NSObject




@property(nonatomic,strong) id<INetHttp>  mNetHttp;
 
+(instancetype)getInstance;

- (void)init:(id<INetHttp>)netHttp andKvdb:(id<IKvdb>)kvdb  option:(nullable NSDictionary *)opt;


- (void)createAdView:(NSString *)pagekey posKey:(NSString *)poskey  view:(UIView *)view option:(nullable NSDictionary *)opt;


@end

NS_ASSUME_NONNULL_END
