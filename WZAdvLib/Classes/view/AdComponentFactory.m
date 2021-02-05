//
//  ViewFactor.m
//  Pods
//
//  Created by YangMean on 2020/8/18.
//

#import "AdComponentFactory.h"
#import "JpositionInfo.h"
#import "SliderView.h"
#import "AdLaunchView.h"

@interface AdComponentFactory(){

}
@end
 
@implementation AdComponentFactory

static AdComponentFactory *sInstance = nil;
+(instancetype)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];
    });
    return sInstance;
}


- (UIView *)createAdComponentWithAdType:(viewType)type dic:(NSDictionary *)dic{
    if (type ==adLaunchView) {
        return [AdLaunchView createAdImageView:dic];
    }else if (type==adSliderView){
        return [SliderView createSliderView:dic];
    }
      return nil;
}

 

@end
