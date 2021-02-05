//
//  JAdvInfo.h
//  XuanShang
//
//  Created by YangMean on 2020/8/18.
//  Copyright © 2020 felix. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface JpositionInfo : NSObject

@property(nonatomic,strong)NSString *advType;  // 类型
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *titleTxt;
@property(nonatomic,strong)NSString *descns;
@property(nonatomic,strong)NSString *shortKey;
@property(nonatomic,strong)NSString *toPgae;
@property(nonatomic,strong)NSString *moreTxt;

- (id)initWithDict:(NSDictionary *)dict;



@end

NS_ASSUME_NONNULL_END
