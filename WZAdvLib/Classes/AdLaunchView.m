//
//  AdLaunchView.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "AdLaunchView.h"
#import "XHLaunchAd.h"


static NSMutableArray *redirectUrlArr;
static NSMutableArray *picArr;

@implementation AdLaunchView

+ (UIView *)createAdLaunchView:(NSDictionary *)dic{
       picArr = [NSMutableArray new];
       NSDictionary *positionInfo = [dic objectForKey:@"positionInfo"];
        NSArray *planList = [dic objectForKey:@"planList"];
        NSString *width =[positionInfo objectForKey:@"width1"];
        NSString *height =[positionInfo objectForKey:@"height1"];
        NSString *str = [NSString stringWithFormat:@"img_%@x%@",width,height];
        [planList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [picArr addObject:obj[@"pics"][str]];
                [redirectUrlArr addObject:[obj valueForKey:@"jumpUrl"]];
    }];




   [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
        imageAdconfiguration.imageNameOrURLString  = @"https://imgcdn-prd.pydp888.com/3/block/ca/ca43a4a020db13939d529fa411933c95.jpg";
        imageAdconfiguration.imageNameOrURLString  =picArr[0];
//        imageAdconfiguration.openModel  = redirectUrlArr[0] ;
         imageAdconfiguration.duration   = 3;
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
       
        return nil;
}



@end
