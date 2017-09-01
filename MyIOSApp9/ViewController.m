//
//  ViewController.m
//  MyIOSApp9
//
//  Created by lingdian on 17/9/1.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "ViewController.h"
#import "PersonInfo.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController
#pragma mark--- dataSource
// 返回 几列数据
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
//第component列 有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==0){
        return self.cityList.count;
    }else if(component==1){
        return [self getAreaArray].count;
    }
    return 0;
}


#pragma mark--- delegate
//第component 第row行 返回的字符串作为title
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if(component==0){//第一列
        PersonInfo* info=self.cityList[row];
        return info.cityName;
    }else if(component==1){//第二列
        NSInteger firstIndex= [self currentFirstIndex];
        NSArray* childArray=[self getAreaArray:firstIndex];
        return childArray[row];
    }
    return @"xxx";
}

//滑动选中的回调
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==0){
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:TRUE];
    }
}

#pragma mark--- 自定义方法
//获取第一列  所对应第二列的数组
-(NSArray*)getAreaArray:(NSInteger)index{
    PersonInfo* personInfo=self.cityList[index];
    return  personInfo.areaList;
}

//获取第一列 所对应第二列的数组
-(NSArray*)getAreaArray{
    NSInteger index=[self currentFirstIndex];
    
    PersonInfo* personInfo=self.cityList[index];
    return  personInfo.areaList;

}
//获取当前第一列被选中的索引
-(NSInteger)currentFirstIndex{
    return [self.pickerView selectedRowInComponent:0];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    
    NSArray* beijing=@[@"海淀",@"东城",@"西城",@"朝阳"];
    NSArray* tianjin=@[@"南开1",@"南开2",@"南开3",@"南开4"];
    NSArray* shanghai=@[@"徐汇1",@"徐汇2",@"徐汇3",@"徐汇4"];
    NSArray* chongqing=@[@"山顶1",@"山顶2",@"山顶3",@"山顶4"];

    
    self.cityList=[NSMutableArray new];
    
    PersonInfo* beijingObj=[PersonInfo createInstanceWithCity:@"北京" withAreaList:beijing];
    
    PersonInfo* tianjinObj=[PersonInfo createInstanceWithCity:@"天津" withAreaList:tianjin];
    
    PersonInfo* shanghaiObj=[PersonInfo createInstanceWithCity:@"上海" withAreaList:shanghai];
    
    PersonInfo* chongqingObj=[PersonInfo createInstanceWithCity:@"重庆" withAreaList:chongqing];
    
    [self.cityList addObject:beijingObj];
    [self.cityList addObject:tianjinObj];
    [self.cityList addObject:shanghaiObj];
    [self.cityList addObject:chongqingObj];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
