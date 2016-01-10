//
//  ZYClockImage.m
//  时钟
//
//  Created by 章芝源 on 16/1/10.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYClockImage.h"
///clock face
#define  ZYCLOCKIMAGESIZE self.bounds.size

///indicator
#define ZYINDICATORHAND 0.8

/// Angle  per  time
#define ZYANGLEPERSECOND 6
#define ZYANGLEPERMINUTE 6
#define ZYANGLEPERHOUR 30
#define ZYANGLEPERMINUTEFORHUOR 0.5

///cgfloat 转化成度数
#define timeToAngle(a) ((a)/ 180.0 * M_PI)
@interface ZYClockImage()
@property(nonatomic, strong)CALayer *secondHand;
@property(nonatomic, strong)CALayer *minuteHand;
@property(nonatomic, strong)CALayer *hourHand;
@end
@implementation ZYClockImage

/*
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    //add indicator
    [self addSecondHand];
    [self addMinuteHand];
    [self addHourHand];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    ///主动更新时间
    [self updateTime];
}

- (void)updateTime
{
    //获得当前秒数
    //1.获得当前时间
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [calendar components:NSCalendarUnitHour| NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    CGFloat sec = cmp.second;
    CGFloat min = cmp.minute;
    CGFloat hou = cmp.hour;
    //计算旋转度数
    CGFloat secondAngle = timeToAngle(sec * ZYANGLEPERSECOND);
    CGFloat minuteAngle = timeToAngle(min * ZYANGLEPERMINUTE);
    CGFloat hourAngle = timeToAngle(hou * ZYANGLEPERHOUR);
    //每分钟时针也旋转了一定度数
    CGFloat secondForHour = timeToAngle(min * ZYANGLEPERMINUTEFORHUOR);
    hourAngle = hourAngle + secondForHour;
    
    //进行旋转
    self.secondHand.transform = CATransform3DMakeRotation(secondAngle, 0, 0, 1);
    self.minuteHand.transform = CATransform3DMakeRotation(minuteAngle, 0, 0, 1);
    self.hourHand.transform = CATransform3DMakeRotation(hourAngle, 0, 0, 1);    
}

- (void)addSecondHand
{
    //indicator's frame
    CGFloat width = 1;
    CGFloat height = 85;
    self.secondHand.bounds = CGRectMake(0, 0, width, height);
    self.secondHand.backgroundColor = [UIColor blackColor].CGColor;
    //anchor
    self.secondHand.position = CGPointMake(ZYCLOCKIMAGESIZE.width * 0.5, ZYCLOCKIMAGESIZE.height * 0.5);
    self.secondHand.anchorPoint = CGPointMake(ZYINDICATORHAND, ZYINDICATORHAND);
    [self.layer addSublayer:self.secondHand];
}

- (void)addMinuteHand
{
    //indicator's frame
    CGFloat width = 2;
    CGFloat height = 75;
    self.minuteHand.bounds = CGRectMake(0, 0, width, height);
    self.minuteHand.backgroundColor = [UIColor blackColor].CGColor;
    //anchor
    self.minuteHand.position = CGPointMake(ZYCLOCKIMAGESIZE.width * 0.5, ZYCLOCKIMAGESIZE.height * 0.5);
    self.minuteHand.anchorPoint = CGPointMake(ZYINDICATORHAND, ZYINDICATORHAND);
    [self.layer addSublayer:self.minuteHand];

}

- (void)addHourHand
{
    //indicator's frame
    CGFloat width = 4;
    CGFloat height = 65;
    self.hourHand.bounds = CGRectMake(0, 0, width, height);
    self.hourHand.backgroundColor = [UIColor blackColor].CGColor;
    //anchor
    self.hourHand.position = CGPointMake(ZYCLOCKIMAGESIZE.width * 0.5, ZYCLOCKIMAGESIZE.height * 0.5);
    self.hourHand.anchorPoint = CGPointMake(ZYINDICATORHAND, ZYINDICATORHAND);
    [self.layer addSublayer:self.hourHand];
}



#pragma mark - 懒加载
- (CALayer *)secondHand
{
    if (!_secondHand) {
        _secondHand = [CALayer layer];
    }
    return _secondHand;
}

- (CALayer *)minuteHand
{
    if (!_minuteHand) {
        _minuteHand = [CALayer layer];
    }
    return _minuteHand;
}

- (CALayer *)hourHand
{
    if (!_hourHand) {
        _hourHand = [CALayer layer];
    }
    return _hourHand;
}

@end
