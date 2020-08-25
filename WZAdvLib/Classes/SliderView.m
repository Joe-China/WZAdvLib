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

@interface SliderView()<SDCycleScrollViewDelegate>{


}

@end

@implementation SliderView

+ (UIView *)createSliderView{
        SDCycleScrollView *cycleScrollView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,WIDTH, WidthScale(150))  delegate:self placeholderImage:[UIImage imageNamed:@"123456"]];

       cycleScrollView.imageURLStringsGroup = @[@"https://imgcdn-prd.pydp888.com/3/block/f4/f455d98065b583267d315114211a71da.jpg"];
        
//        cycleScrollView.imageURLStringsGroup =picArr;

        cycleScrollView.autoScrollTimeInterval = 3.0;
        if (cycleScrollView.imageURLStringsGroup.count==1) {
            cycleScrollView.autoScroll = NO;
         }
        cycleScrollView.backgroundColor =[UIColor clearColor];
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView.pageDotColor = [UIColor lightGrayColor];
        return cycleScrollView;
}






@end
