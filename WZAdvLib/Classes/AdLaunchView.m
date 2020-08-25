//
//  AdLaunchView.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "AdLaunchView.h"
#import "XHLaunchAd.h"

@implementation AdLaunchView

+ (UIView *)createAdLaunchView{
 
   [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
        imageAdconfiguration.imageNameOrURLString  = @"https://imgcdn-prd.pydp888.com/3/block/ca/ca43a4a020db13939d529fa411933c95.jpg";
//        imageAdconfiguration.imageNameOrURLString  =picArr[0];
//        imageAdconfiguration.openModel  = redirectUrlArr[0] ;
         imageAdconfiguration.duration   = 3;
//        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:viewFactor];
        return nil;
}

@end
