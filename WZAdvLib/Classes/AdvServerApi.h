//
//  AdvServerApi.h
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "INetHttp.h"
#import "IKvdb.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdvServerApi : NSObject

 
+(instancetype)getInstance;


- (void)init:(id<INetHttp>)netHttp andKvdb:(id<IKvdb>)kvdb;



- (void)reqAdvData:(NSString *)pageKey  andPosKey:(NSString *)posKey callback:(iCallback)callback;


-(void) setAdInfoToDb:(NSDictionary*)dic pageKey:(NSString *)pageKey posKey:(NSString *)posKey;


-(NSDictionary *) getAdInfoFromDb:(NSString *)pageKey  posKey:(NSString *)posKey;


@end

NS_ASSUME_NONNULL_END
