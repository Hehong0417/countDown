//
//  SBViewController.h
//  SBTickerViewDemo
//
//  Created by LaoTao on 14-8-18.
//  Copyright (c) 2014年 CaiGaoBaDou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBTickerView;

@interface SBViewController : UIViewController {
    NSString *_currentClock;
    NSArray *_clockTickers;
}

@property (weak, nonatomic) IBOutlet SBTickerView *clockTickerViewHour1;

@property (weak, nonatomic) IBOutlet SBTickerView *clockTickerViewHour2;

@property (weak, nonatomic) IBOutlet SBTickerView *clockTickerViewMinute1;

@property (weak, nonatomic) IBOutlet SBTickerView *clockTickerViewMinute2;

@property (weak, nonatomic) IBOutlet SBTickerView *clockTickerViewSecond1;

@property (weak, nonatomic) IBOutlet SBTickerView *clockTickerViewSecond2;

@end
