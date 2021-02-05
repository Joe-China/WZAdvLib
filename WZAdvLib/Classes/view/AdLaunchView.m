//
//  AdLaunchView.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "AdLaunchView.h"
#import "XHLaunchAd.h"
 
#define  WIDTH       [UIScreen mainScreen].bounds.size.width
#define  HEIGHT      [UIScreen mainScreen].bounds.size.height

static NSMutableArray *redirectUrlArr;
static NSMutableArray *picArr;
static AdLaunchView *adLaunchView;
@implementation AdLaunchView

+ (UIView *)createAdImageView:(NSDictionary *)dic{
       picArr = [NSMutableArray new];
       redirectUrlArr = [NSMutableArray new];
       adLaunchView = [[AdLaunchView alloc] init];
       NSDictionary *positionInfo = [dic objectForKey:@"positionInfo"];
        NSArray *planList = [dic objectForKey:@"planList"];
       __block NSString *str;
        [planList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [redirectUrlArr addObject:[obj valueForKey:@"jumpUrl"]];
                if (WIDTH/HEIGHT >0.5) {
                   NSString *width =[positionInfo objectForKey:@"width"];
                   NSString *height =[positionInfo objectForKey:@"height"];
                   str = [NSString stringWithFormat:@"img_%@x%@",width,height];
                    [picArr addObject:obj[@"pics"][str]];
                 }else{
                   NSString *width1 =[positionInfo objectForKey:@"width1"];
                   NSString *height1 =[positionInfo objectForKey:@"height1"];
                   str = [NSString stringWithFormat:@"img_%@x%@",width1,height1];
                   [picArr addObject:obj[@"pics"][str]];
              }
    }];

        [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
        imageAdconfiguration.imageNameOrURLString  =picArr[0];
        imageAdconfiguration.openModel  = redirectUrlArr[0] ;
        imageAdconfiguration.duration   = 5;
         
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:adLaunchView];
       
        return nil;
}


- (void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenModel:(id)openModel clickPoint:(CGPoint)clickPoint{
       NSString *urlString = (NSString *)openModel;
       
     if(urlString == nil || [urlString isEqualToString:@""]){
          return;
    }
    
    [[NSNotificationCenter  defaultCenter] postNotificationName:@"launchIndex" object:urlString userInfo:nil];
}

@end
