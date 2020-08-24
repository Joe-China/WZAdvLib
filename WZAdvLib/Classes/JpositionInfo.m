//
//  JAdvInfo.m
//  XuanShang
//
//  Created by YangMean on 2020/8/18.
//  Copyright © 2020 felix. All rights reserved.
//

#import "JpositionInfo.h"

@implementation JpositionInfo


- (id)initWithDict:(NSDictionary *)dict{
    if(self = [super init]) {
        if([dict isKindOfClass:[NSDictionary class]]){
            self.name = dict[@"name"];
            self.advType = dict[@"advType"];
            self.titleTxt = dict[@"titleTxt"];
            self.descns = dict[@"descns"];
            self.shortKey = dict[@"shortKey"];
            self.toPgae = dict[@"toPgae"];
            self.moreTxt = dict[@"moreTxt"];
        }
    }
    return self;
}


@end
