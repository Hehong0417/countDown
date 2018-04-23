//
//  SBViewController.m
//  SBTickerViewDemo
//
//  Created by LaoTao on 14-8-18.
//  Copyright (c) 2014年 CaiGaoBaDou. All rights reserved.
//

#import "SBViewController.h"
#import "SBTickerView.h"
#import "SBTickView.h"

@interface SBViewController ()

@end

@implementation SBViewController

@synthesize clockTickerViewHour1;
@synthesize clockTickerViewHour2;
@synthesize clockTickerViewMinute1;
@synthesize clockTickerViewMinute2;
@synthesize clockTickerViewSecond1;
@synthesize clockTickerViewSecond2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(numberTick:) userInfo:nil repeats:YES];
    
    _currentClock = @"000000";
    _clockTickers = [NSArray arrayWithObjects:
                     clockTickerViewHour1,
                     clockTickerViewHour2,
                     clockTickerViewMinute1,
                     clockTickerViewMinute2,
                     clockTickerViewSecond1,
                     clockTickerViewSecond2, nil];
    for (SBTickerView *ticker in _clockTickers) {
        [ticker setFrontView:[SBTickView tickViewWithTitle:@"0" fontSize:45.0]];
    }
}

- (void)numberTick:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HHmmss"];
    NSString *newClock = [formatter stringFromDate:[NSDate date]];
    [_clockTickers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![[_currentClock substringWithRange:NSMakeRange(idx, 1)] isEqualToString:[newClock substringWithRange:NSMakeRange(idx, 1)]]) {
            [obj setBackView:[SBTickView tickViewWithTitle:[newClock substringWithRange:NSMakeRange(idx, 1)] fontSize:45.]];
            [obj tick:SBTickerViewTickDirectionDown animated:YES completion:nil];
        }
    }];
    _currentClock = newClock;
    NSLog(@"%@,",_currentClock);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
