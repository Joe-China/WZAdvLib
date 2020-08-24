//
//  ViewFactor.m
//  Pods
//
//  Created by YangMean on 2020/8/18.
//

#import "AdComponentFactory.h"
#import "JpositionInfo.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import <XHLaunchAd/XHLaunchAd.h>
#import "JpositionInfo.h"


#define  WIDTH    [UIScreen mainScreen].bounds.size.width
#define WidthScale(number) ([UIScreen mainScreen].bounds.size.width/375.*(number))


static NSArray *imagesURLStrings;

static AdComponentFactory *viewFactor;
  
@interface AdComponentFactory()<SDCycleScrollViewDelegate>{
    id<INetHttp>  mNetHttp;
    NSDictionary *mOption;
    id<IKvdb> mKvdb;
    id<IRouter>mRouter;
    
    JpositionInfo *mPosModel;
    NSMutableArray *redirectUrlArr;
    NSMutableArray *picArr;
    UIView *aview;
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


- (void)init:(id<INetHttp>)netHttp andKvdb:(id<IKvdb>)kvdb  option:(nullable NSDictionary *)opt{
            mNetHttp = netHttp;
            mKvdb = kvdb;
            mOption = opt;
            mRouter = router;
}


- (void)createAdView:(NSString *)pagekey posKey:(NSString *)poskey  view:(UIView *)view option:(nullable NSDictionary *)opt{
       NSLog(@"%@",view);
       
       [mNetHttp reqAdsDataWithPagekey:pagekey andPosKey:poskey callback:^(NSDictionary * res) {
            NSLog(@"%@",res);
            picArr = [NSMutableArray new];
            redirectUrlArr = [NSMutableArray new];
            NSDictionary *positionDic = [res objectForKey:@"positionInfo"];
            NSArray *planList = [res objectForKey:@"planList"];
            NSString *width =[positionDic objectForKey:@"width"];
            NSString *height =[positionDic objectForKey:@"height"];
            NSString *str = [NSString stringWithFormat:@"img_%@x%@",width,height];
            [planList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [picArr addObject:obj[@"pics"][str]];  
                [redirectUrlArr addObject:[obj valueForKey:@"jumpUrl"]];
            }];
        
            mPosModel = [[JpositionInfo alloc] initWithDict:positionDic];
            NSString *String = [NSString stringWithFormat:@"%@",mPosModel.advType];
            if ([String isEqualToString:@"4"]) {
               aview =[self createAdComponentWithAdType:mPosModel.advType];
               [view addSubview:aview];
            }else if([String isEqualToString:@"2"]){
              [self createAdComponentWithAdType:mPosModel.advType];
            }
      }];
}

- (void)removeAdView{
   [aview removeFromSuperview];
}




- (UIView *)createAdComponentWithAdType:(NSString *)type{
//   viewFactor = [[AdComponentFactory alloc] init];
    NSString *String = [NSString stringWithFormat:@"%@",type];
    if ([String isEqualToString:@"4"]) {
    SDCycleScrollView *cycleScrollView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,WIDTH, WidthScale(150))  delegate:self placeholderImage:[UIImage imageNamed:@"123456"]];
        
//        cycleScrollView.imageURLStringsGroup = @[@"https://imgcdn-prd.pydp888.com/3/block/f4/f455d98065b583267d315114211a71da.jpg",@"https://imgcdn-prd.pydp888.com/3/block/ca/ca43a4a020db13939d529fa411933c95.jpg"];
        
        cycleScrollView.imageURLStringsGroup =picArr;
        
        cycleScrollView.autoScrollTimeInterval = 3.0;
        if (cycleScrollView.imageURLStringsGroup.count==1) {
            cycleScrollView.autoScroll = NO;
         }
        cycleScrollView.backgroundColor =[UIColor clearColor];
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView.pageDotColor = [UIColor lightGrayColor];
        return cycleScrollView;

    }else if ([String isEqualToString:@"2"]) {
       [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
//        imageAdconfiguration.imageNameOrURLString  = @"https://imgcdn-prd.pydp888.com/3/block/ca/ca43a4a020db13939d529fa411933c95.jpg";
        imageAdconfiguration.imageNameOrURLString  =picArr[0];
        imageAdconfiguration.openModel  = redirectUrlArr[0] ;
         imageAdconfiguration.duration   = 3;
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:viewFactor];
    }
    
      return nil;
}



- (void)uploadPositionWithMapId:(NSInteger)mapId  position:(NSInteger)pos        total:(NSInteger)total maps:(nullable NSDictionary *)maps{
     [mNetHttp uploadPositionShowWithMapId:mapId position:pos totoal:total callback:^(NSDictionary * dic) {
            NSLog(@"上传成功");
     }];
}



- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
       NSLog(@"%ld",(long)index);
       [self.delegate doCycleViewClick:index view:cycleScrollView redirectUrls:redirectUrlArr];
       
}


- (void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenModel:(id)openModel clickPoint:(CGPoint)clickPoint{
        [self.delegate doLaunchAdClick];
}


@end