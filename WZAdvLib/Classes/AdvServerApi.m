//
//  AdvServerApi.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "AdvServerApi.h"

@implementation AdvServerApi{
    id<INetHttp>  mNetHttp;
    
    id<IKvdb> mKvdb;
}


static AdvServerApi *sInstance = nil;

+(instancetype)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];
    });
    return sInstance;
}


- (void)init:(id<INetHttp>)netHttp andKvdb:(id<IKvdb>)kvdb{
    mNetHttp = netHttp;
    mKvdb = kvdb;
}



// network 请求广告数据
- (void)reqAdvData:(NSString *)pageKey  andPosKey:(NSString *)posKey callback:(iCallback)callback{
    [mNetHttp reqAdsDataWithPagekey:pageKey andPosKey:posKey callback:^(NSDictionary *dic) {
          callback(dic);
   }];
}


// 上传数据
- (void)uploadPositionWithMapId:(NSInteger)mapId  position:(NSInteger)pos        total:(NSInteger)total maps:(nullable NSDictionary *)maps{
     [mNetHttp uploadPositionShowWithMapId:mapId position:pos totoal:total callback:^(NSDictionary * dic) {
            NSLog(@"上传成功");
     }];
}



-(void) setAdInfoToDb:(NSDictionary*)dic pageKey:(NSString *)pageKey posKey:(NSString *)posKey{
      [mKvdb setKvdb:dic key:[NSString stringWithFormat:@"%@_%@",pageKey,posKey]];
}


-(NSDictionary *) getAdInfoFromDb:(NSString *)pageKey  posKey:(NSString *)posKey{
     return [mKvdb getKvdb:[NSString stringWithFormat:@"%@_%@",pageKey,posKey]];

}


@end
