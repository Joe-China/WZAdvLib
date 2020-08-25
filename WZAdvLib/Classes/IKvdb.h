//
//  IKvdb.h
//  XuanShang
//
//  Created by YangMean on 2020/8/18.
//  Copyright © 2020 felix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IKvdb <NSObject>

- (void)setKvdb:(NSDictionary *)dic  key:(NSString *)key;

- (NSDictionary *)getKvdb:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
