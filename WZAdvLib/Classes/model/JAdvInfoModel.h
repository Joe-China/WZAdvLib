//
//  JAdvInfoModel.h
//  Pods
//
//  Created by YangMean on 2020/8/25.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAdvInfoModel : JSONModel
@property(nonatomic,strong)NSDictionary *positionInfo;
@property(nonatomic,strong)NSArray *planList;


@end

NS_ASSUME_NONNULL_END
