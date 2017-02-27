//
//  BasicViewController.m
//  Demo-贝塞尔曲线
//
//  Created by Suning on 2017/2/23.
//  Copyright © 2017年 jf. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"基础图形";
    [self setUpBackground];
    
}

-(void)setUpBackground{
    //方形
    UIBezierPath *beziaPath1 = [UIBezierPath bezierPathWithRect:CGRectMake(80, 80, 100, 120)];
    CAShapeLayer *layer1 = [[CAShapeLayer alloc]init];
    layer1.path = beziaPath1.CGPath;
    layer1.fillColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:layer1];
    
    //圆形
    UIBezierPath *beziaPath2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 250, 120, 100)];
    CAShapeLayer *layer2 = [[CAShapeLayer alloc]init];
    layer2.path = beziaPath2.CGPath;
    layer2.fillColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:layer2];
    
    UIBezierPath *beziaPath3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(80, 400, 100, 100) cornerRadius:50];
    CAShapeLayer *layer3 = [[CAShapeLayer alloc]init];
    layer3.path = beziaPath3.CGPath;
    layer3.fillColor = [UIColor clearColor].CGColor;
    layer3.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer3];
}

@end
