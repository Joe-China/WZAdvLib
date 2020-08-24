//
//  INetHttp.h
//  XuanShang
//
//  Created by YangMean on 2020/8/17.
//  Copyright © 2020 felix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^iCallback)(NSDictionary *_Nonnull);

@protocol INetHttp <NSObject>


- (void)reqAdsDataWithPagekey:(NSString *)pageKey andPosKey:(NSString *)posKey callback:(iCallback)callback;

@optional
- (void)uploadPositionShowWithMapId:(NSInteger)mapId  position:(NSInteger)pos  totoal:(NSInteger)total callback:(iCallback)callback;


@end

NS_ASSUME_NONNULL_END
