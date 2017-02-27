//
//  CurveViewController.m
//  Demo-贝塞尔曲线
//
//  Created by Suning on 2017/2/23.
//  Copyright © 2017年 jf. All rights reserved.
//

#import "CurveViewController.h"

@interface CurveViewController (){
    CAShapeLayer *_animationLayer;
}


@end

@implementation CurveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"曲线";
    [self setUpBackground];
    [self setUpBackground2];
    [self bezierPathAnimation];
}

-(void)setUpBackground{
    //1个控制点
    CGPoint startPoint = CGPointMake(100, 80);
    CGPoint endPoint = CGPointMake(250, 70);
    CGPoint controlPoint = CGPointMake(190, 150);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 10, 10);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 10, 10);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 10, 10);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor brownColor].CGColor;
    
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer];
}

-(void)setUpBackground2{
    //2个控制点
    CGPoint startPoint = CGPointMake(100, 280);
    CGPoint endPoint = CGPointMake(250, 270);
    CGPoint controlPoint1 = CGPointMake(190, 350);
    CGPoint controlPoint2 = CGPointMake(220, 180);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 10, 10);
    layer1.backgroundColor = [UIColor blueColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 10, 10);
    layer2.backgroundColor = [UIColor blueColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(controlPoint1.x, controlPoint1.y, 10, 10);
    layer3.backgroundColor = [UIColor blueColor].CGColor;
    
    CALayer *layer4 = [CALayer layer];
    layer4.frame = CGRectMake(controlPoint2.x, controlPoint2.y, 10, 10);
    layer4.backgroundColor = [UIColor blueColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor cyanColor].CGColor;
    
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer4];
    [self.view.layer addSublayer:layer];
}

-(void)bezierPathAnimation{
    CGPoint startPoint = CGPointMake(100, 380);
    CGPoint endPoint = CGPointMake(250, 370);
    CGPoint controlPoint1 = CGPointMake(190, 450);
    CGPoint controlPoint2 = CGPointMake(220, 330);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:layer];
    _animationLayer = layer;
    
    NSArray *btnName = [NSArray arrayWithObjects:@"动画1",@"动画2",@"动画3", nil];
    for (NSInteger i=0; i<3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10+(10+100)*i, 500, 100, 50);
        [btn setTitle:[btnName objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)clickBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 0:{
            CABasicAnimation *animation = [CABasicAnimation animation];
            animation.keyPath = @"strokeEnd";
            animation.fromValue = [NSNumber numberWithInteger:0];
            animation.toValue = [NSNumber numberWithFloat:1];
            animation.duration = 2.0f;
            [_animationLayer addAnimation:animation forKey:nil];
            
        }
            break;
        case 1:{
            CABasicAnimation *animation1 = [CABasicAnimation animation];
            animation1.keyPath = @"strokeStart";
            animation1.fromValue = [NSNumber numberWithFloat:0.5];
            animation1.toValue = [NSNumber numberWithFloat:0];
            animation1.duration = 2.0f;
            
            CABasicAnimation *animation2 = [CABasicAnimation animation];
            animation2.keyPath = @"strokeEnd";
            animation2.fromValue = [NSNumber numberWithFloat:0.5];
            animation2.toValue = [NSNumber numberWithFloat:1];
            animation2.duration = 2.0f;
            
            [_animationLayer addAnimation:animation1 forKey:nil];
            [_animationLayer addAnimation:animation2 forKey:nil];
        }
            
            break;
        case 2:{
            CABasicAnimation *anima = [CABasicAnimation animation];
            anima.keyPath = @"lineWidth";
            anima.fromValue = [NSNumber numberWithFloat:0];
            anima.toValue = [NSNumber numberWithFloat:9];
            anima.duration = 2.0f;
            [_animationLayer addAnimation:anima forKey:nil];
        }
            
            break;
        default:
            break;
    }
}


@end
