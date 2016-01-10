//
//  ViewController.m
//  时钟
//
//  Created by 章芝源 on 16/1/9.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYClockImage.h"

///关于Masonry
// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
#import <Masonry.h>



@interface ViewController ()
//表盘
@property(nonatomic, strong)UIImageView *clockImage;
//时针

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置UI
    [self setupUI];
    
}

- (void)setupUI
{
    ZYClockImage *clockImage = [[ZYClockImage alloc]init];
    clockImage.image = [UIImage imageNamed:@"钟表"];
    self.clockImage = clockImage;
    [self.view addSubview:clockImage];
    [clockImage makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(200);
    }];
    
    NSDate *date = [NSDate date];
    
    [NSThread sleepForTimeInterval:5.0];
    
    NSDate *date1 = [NSDate date];

}



@end
