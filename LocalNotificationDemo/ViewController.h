//
//  ViewController.h
//  LocalNotificationDemo
//
//  Created by 玲 阿 on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView *picker;
    NSMutableArray *hours;
    NSMutableArray *minutes;
    
    int hour;
    int minute;
}

@end
