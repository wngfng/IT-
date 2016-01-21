//
//  WFModel.h
//  IT资讯
//
//  Created by qingyun on 16/1/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *mancount;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *time;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
