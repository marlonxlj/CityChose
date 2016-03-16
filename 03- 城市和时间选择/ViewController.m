//
//  ViewController.m
//  03- 城市和时间选择
//
//  Created by 余婷 on 16/1/4.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 时间选择器
//时间选择器
- (IBAction)timePicker:(id)sender {
    
    UIDatePicker * datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 250, self.view.frame.size.width, 250)];
    
    //设置tag值
    datePicker.tag = 100;
    
    //1.设置时间模型
//    UIDatePickerModeTime,  上午  时  分
//    UIDatePickerModeDate,  2015年 1月 4日
//    UIDatePickerModeDateAndTime,1月5日 上午 5 20
//    UIDatePickerModeCountDownTimer, 1hour 1min
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    //2.设置时区
    [datePicker setLocale:[NSLocale autoupdatingCurrentLocale]];
    
    //3.设置能选择的时间的最小值和最大值
    datePicker.maximumDate = [NSDate date];
    
    //1940-1-1
    NSDateFormatter * fm = [[NSDateFormatter alloc] init];
    [fm setDateFormat:@"yyyy-MM-dd"];
    NSDate * minDate = [fm dateFromString:@"1990-01-01"];
    
    datePicker.minimumDate = minDate;
    
    
    [self.view addSubview:datePicker];

}


#pragma mark - pickerView
- (IBAction)cityPicker:(id)sender {
    
    //1.创建一个UIPickerView对象
    UIPickerView * cityView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300)];
    
    //设置背景色
    cityView.backgroundColor = [UIColor greenColor];
    
    //设置代理
    cityView.dataSource = self;
    cityView.delegate = self;
    
    //刷新数据
    //刷新所有组
    [cityView reloadAllComponents];
    //刷新指定组
//    [cityView reloadComponent:<#(NSInteger)#>]
    
    
    //添加到界面上
    [self.view addSubview:cityView];
}

#pragma mark - PickerView Datasource
// returns the number of 'columns' to display.
//组数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    

    
    return 2;
}

// returns the # of rows in each component..
//每一组的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    
    if (component == 0) {
        
        return 10;
        
    }else if(component == 1){
    
        return 2;
        
    }else{
    
        return  5;
    }
}

#pragma mark - PickerViewDelegate
//返回每一组的每一行显示的文字信息
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

//    return @"标题";
    if (component == 0) {
        
        return @"省名";
    }else{
    
        
        return @"城市名";
    }
    

}

//当选中（当滚动停止的时候）会调用这个方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    NSLog(@"第%ld组 第%ld行被选择啦",component, row);
    
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UIView * tview = [self.view viewWithTag:100];
    [tview removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

@end
