//
//  PersonInfo.m
//  MyIOSApp9
//
//  Created by lingdian on 17/9/1.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "PersonInfo.h"

@implementation PersonInfo
-(instancetype)init{
    if (self=[super init]) {
        self.cityName=@"";
        self.areaList=[NSArray new];
    }
    return self;
}
-(instancetype)initWithCity:(NSString*)pCity withAreaList:(NSArray*)pAreaList{
    if (self=[super init]) {
        self.cityName=pCity;
        self.areaList=pAreaList;
    }
    return self;
}
+(PersonInfo*)createInstanceWithCity:(NSString*)pCity withAreaList:(NSArray*)pAreaList{
    PersonInfo* info=[[PersonInfo alloc]initWithCity:pCity withAreaList:pAreaList];
    return info;
}
@end
