//
//  SimpleTestController.m
//  Demo-贝塞尔曲线
//
//  Created by Suning on 2017/2/24.
//  Copyright © 2017年 jf. All rights reserved.
//

#import "SimpleTestController.h"

@interface SimpleTestController ()

@end

@implementation SimpleTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setUpBackground];
    
}

-(void)setUpBackground{
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *beziPath = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(0, 300);
    CGPoint controlPoint = CGPointMake(kScreenWidth/2, 300-90);
    
    [beziPath moveToPoint:startPoint];
    [beziPath addLineToPoint:CGPointMake(startPoint.x, startPoint.y+200)];
    [beziPath addLineToPoint:CGPointMake(kScreenWidth, startPoint.y+200)];
    [beziPath addLineToPoint:CGPointMake(kScreenWidth, startPoint.y)];
    [beziPath addQuadCurveToPoint:startPoint controlPoint:controlPoint];
    layer.path = beziPath.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:layer];
}

@end
