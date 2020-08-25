//
//  ComponentFactory.h
//  XuanShang
//
//  Created by YangMean on 2020/8/18.
//  Copyright © 2020 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "INetHttp.h"
#import "IKvdb.h"


NS_ASSUME_NONNULL_BEGIN

typedef enum viewType{
     slider = 1,
     launch = 2,
} viewType;


@protocol AdComponentFactoryDelegate <NSObject>

@optional

- (void)doCycleViewClick:(NSInteger )index  view:(UIView *)view redirectUrls:(NSMutableArray *)urls;
- (void)doLaunchAdClick;
@end

@interface AdComponentFactory : NSObject

+(instancetype)getInstance;
 
//- (void)init:(id<INetHttp>)netHttp andKvdb:(id<IKvdb>)kvdb  option:(nullable NSDictionary *)opt;
//
//- (void)createAdView:(NSString *)pagekey posKey:(NSString *)poskey  view:(UIView *)view option:(nullable NSDictionary *)opt;
//
//- (void)removeAdView;


- (UIView *)createAdComponentWithAdType:(NSString *)type;

@property (nonatomic, assign) id <AdComponentFactoryDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
