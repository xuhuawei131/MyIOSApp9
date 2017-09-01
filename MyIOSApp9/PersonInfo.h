//
//  PersonInfo.h
//  MyIOSApp9
//
//  Created by lingdian on 17/9/1.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonInfo : NSObject
@property(nonatomic)NSString* cityName;
@property(nonatomic)NSArray* areaList;

-(instancetype)init;
-(instancetype)initWithCity:(NSString*)pCity withAreaList:(NSArray*)pAreaList;
+(PersonInfo*)createInstanceWithCity:(NSString*)pCity withAreaList:(NSArray*)pAreaList;
@end
