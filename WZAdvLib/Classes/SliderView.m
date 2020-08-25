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
@interface SliderView()<SDCycleScrollViewDelegate>{
//     NSMutableArray *redirectUrlArr;
//     NSMutableArray *picArr;
}

@end

@implementation SliderView

+ (UIView *)createSliderView:(NSDictionary *)dic{
        picArr = [NSMutableArray new];
        NSDictionary *positionInfo = [dic objectForKey:@"positionInfo"];
        NSArray *planList = [dic objectForKey:@"planList"];
        NSString *width =[positionInfo objectForKey:@"width"];
        NSString *height =[positionInfo objectForKey:@"height"];
        NSString *str = [NSString stringWithFormat:@"img_%@x%@",width,height];
        [planList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [picArr addObject:obj[@"pics"][str]];
                [redirectUrlArr addObject:[obj valueForKey:@"jumpUrl"]];
            }];



        SDCycleScrollView *cycleScrollView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,WIDTH, WidthScale(150))  delegate:self placeholderImage:[UIImage imageNamed:@"123456"]];

       cycleScrollView.imageURLStringsGroup = @[@"https://imgcdn-prd.pydp888.com/3/block/f4/f455d98065b583267d315114211a71da.jpg",@"https://imgcdn-prd.pydp888.com/3/block/ca/ca43a4a020db13939d529fa411933c95.jpg"];
        
        cycleScrollView.imageURLStringsGroup =picArr;

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
