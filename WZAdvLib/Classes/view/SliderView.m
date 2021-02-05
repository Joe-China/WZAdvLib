//
//  SliderView.m
//  XuanShang
//
//  Created by YangMean on 2020/8/24.
//  Copyright © 2020 felix. All rights reserved.
//

#import "SliderView.h"
#import "SDCycleScrollView.h"
 
#define  WIDTH    [UIScreen mainScreen].bounds.size.width
#define WidthScale(number) ([UIScreen mainScreen].bounds.size.width/375.*(number))


static NSMutableArray *redirectUrlArr;
static NSMutableArray *picArr;
static SliderView    *sliderView;

@interface SliderView()<SDCycleScrollViewDelegate>{
    NSMutableArray *picArr;
}

@end

@implementation SliderView
+ (UIView *)createSliderView:(NSDictionary *)dic{
        picArr = [NSMutableArray new];
        sliderView = [[SliderView alloc] init];
        redirectUrlArr=[NSMutableArray new];
        NSDictionary *positionInfo = [dic objectForKey:@"positionInfo"];
        NSArray *planList = [dic objectForKey:@"planList"];
        NSString *width =[positionInfo objectForKey:@"width"];
        NSString *height =[positionInfo objectForKey:@"height"];
        NSString *str = [NSString stringWithFormat:@"img_%@x%@",width,height];
        [planList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [picArr addObject:obj[@"pics"][str]];
                [redirectUrlArr addObject:[obj valueForKey:@"jumpUrl"]];
                NSLog(@"%@",picArr);
                NSLog(@"%@",redirectUrlArr);
            }];
           
         NSString *toProject =[positionInfo objectForKey:@"toProject"];
         SDCycleScrollView *cycleScrollView;
         if ([toProject isEqualToString:@"/biz/wz/"]) { //DOU K
            cycleScrollView  =  [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(WidthScale(10), WidthScale(0),  WIDTH-WidthScale(20), WidthScale(141))  delegate:sliderView placeholderImage:[UIImage imageNamed:@""]];
            
               cycleScrollView.layer.cornerRadius = WidthScale(5.0);

               cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"dian_selected"];
               cycleScrollView.pageDotImage = [UIImage imageNamed:@"dian"];
               
         }else if ([toProject isEqualToString:@"/biz/xs/"]){ // XUANSHANG
           
           cycleScrollView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,WIDTH, WidthScale(150))  delegate:sliderView placeholderImage:nil];
         }
         
        cycleScrollView.imageURLStringsGroup =picArr;
        cycleScrollView.autoScrollTimeInterval = 3.0;
        if (cycleScrollView.imageURLStringsGroup.count==1) {
            cycleScrollView.autoScroll = NO;
         }
        cycleScrollView.backgroundColor =[UIColor clearColor];
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView.pageDotColor = [UIColor lightGrayColor];
        cycleScrollView.clipsToBounds = YES;
        return cycleScrollView;
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
//       NSLog(@"%ld",(long)index);
       
       [[NSNotificationCenter  defaultCenter] postNotificationName:@"sliderIndex" object:@(index) userInfo:@{@"url":redirectUrlArr}];
       
}


@end
