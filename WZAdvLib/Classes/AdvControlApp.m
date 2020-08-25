//
//  AdvControlApp.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "AdvControlApp.h"
#import "INetHttp.h"
#import "AdvApplication.h"
#import "AdvServerApi.h"
#import "JpositionInfo.h"
#import "AdComponentFactory.h"
 


@interface AdvControlApp(){
    JpositionInfo *mPosModel;
    NSMutableArray *redirectUrlArr;
    NSMutableArray *picArr;
}

@end

@implementation AdvControlApp


static AdvControlApp *sInstance = nil;

+(instancetype)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];
    });
    return sInstance;
}


- (void)createAdView:(NSString *)pagekey posKey:(NSString *)poskey  view:(UIView *)view option:(nullable NSDictionary *)opt{

    NSDictionary *positionDic = [[AdvServerApi getInstance] getAdInfoFromDb:pagekey posKey:poskey];

     [[AdvServerApi getInstance] reqAdvData:pagekey andPosKey:poskey callback:^(NSDictionary * res) {
           self->picArr = [NSMutableArray new];
           self->redirectUrlArr = [NSMutableArray new];
            NSDictionary *positionDic = [res objectForKey:@"positionInfo"];
            NSArray *planList = [res objectForKey:@"planList"];
            NSString *width =[positionDic objectForKey:@"width"];
            NSString *height =[positionDic objectForKey:@"height"];
            NSString *str = [NSString stringWithFormat:@"img_%@x%@",width,height];
            [planList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self->picArr addObject:obj[@"pics"][str]];
                [self->redirectUrlArr addObject:[obj valueForKey:@"jumpUrl"]];
            }];
            
     // 1. 字典转模型
         self->mPosModel = [[JpositionInfo alloc] initWithDict:positionDic];
     // 2.创建view
        UIView *aview = [self creatView:[NSString stringWithFormat:@"%@",self->mPosModel.advType]];
     //3.显示view
         [view removeFromSuperview];
         [view addSubview:aview];
    }];
}


- (void)showView{
  

}



- (UIView *)creatView:(NSString *)type{
   return  [[AdComponentFactory getInstance] createAdComponentWithAdType:type];

}



@end
