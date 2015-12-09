//
//  ViewController.m
//  LocalNotificationDemo
//
//  Created by 玲 阿 on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1.0f];
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 100.0f, 320.0, 150.0f)];
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    
    [self.view addSubview:picker];
    
    hours = [[NSMutableArray alloc] init];
    minutes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 24; i ++) {
        [hours addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 0; i < 60; i ++) {
        [minutes addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    UIButton *remind = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [remind setFrame:CGRectMake(100.0f, 300.0f, 120.0f, 40.0f)];
    [remind setTitle:@"定制闹钟" forState:UIControlStateNormal];
    [remind addTarget:self action:@selector(clock:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:remind];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)clock:(UIButton *)button
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:(@"yyyy-MM-dd HH:mm:ss")];
    NSString *now = [formatter stringFromDate:[NSDate new]];
    
    NSString *hourstr = [NSString stringWithFormat:@"%d",hour];
    NSString *minutestr = [NSString stringWithFormat:@"%d",minute];
    if (hour <= 9) {
        hourstr = [NSString stringWithFormat:@"0%d",hour];
    }
    if (hour <= 9) {
        minutestr = [NSString stringWithFormat:@"0%d",minute];
    }
    NSString *fireTimeStr = [NSString stringWithFormat:@"%@%@:%@:00",[now substringToIndex:11],hourstr,minutestr];
    NSDate *fireTime = [formatter dateFromString:fireTimeStr];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification != nil) { 
        notification.fireDate = fireTime;
        notification.timeZone = [NSTimeZone defaultTimeZone]; 
        
        notification.alertBody = [NSString stringWithFormat:@"%@已到",fireTimeStr]; 
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

#pragma mark UIPickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) 
        return 24;
    else 
        return 60;
}

#pragma mark UIPickerViewDelegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        
        return [hours objectAtIndex:row];
    }
    else {
        return [minutes objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        hour = [[hours objectAtIndex:row] intValue];
    }
    if (component == 1) {
        minute = [[minutes objectAtIndex:row] intValue];
    }
}


@end
