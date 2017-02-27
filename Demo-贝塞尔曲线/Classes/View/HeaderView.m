//
//  HeaderView.m
//  Demo-贝塞尔曲线
//
//  Created by Suning on 2017/2/24.
//  Copyright © 2017年 jf. All rights reserved.
//

#import "HeaderView.h"

#define kHeadViewHeight 150
#define kHeadIconHeight 50

@interface HeaderView(){
    UIImageView *_imgView;
}

@end

@implementation HeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kHeadIconHeight, kHeadIconHeight)];
        imgView.image = [UIImage imageNamed:@"head_icon"];
        imgView.centerX = self.centerX;
        imgView.centerY = self.centerY;
        [self addSubview:imgView];
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeadIcon)];
        [imgView addGestureRecognizer:tap];
        _imgView = imgView;
    }
    return self;
}

-(void)clickHeadIcon{
    NSLog(@"点击头像");
}

-(void)layoutSubviews{
    //为了防止头像下降过快，因此乘0.6
    CGFloat imgViewY = (self.frame.size.height-kHeadViewHeight)+(kHeadViewHeight-kHeadIconHeight)/2;
    _imgView.frame = CGRectMake((kScreenWidth-kHeadIconHeight)/2, imgViewY*0.6, kHeadIconHeight, kHeadIconHeight);
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.00392, 0.54117, 0.85098, 1.0);
    
    //必须保持两个点位置不变，只有控制点坐标改变，否则无法实现效果
    CGFloat h1 = kHeadViewHeight;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    CGContextMoveToPoint(context, w, h1);
    CGContextAddLineToPoint(context, w, 0);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, h1);
    //这样写控制点y坐标，底下会有一片空白
//    CGContextAddQuadCurveToPoint(context, w/2, h, w, h1);
    //改为如下方法解决,将控制点y坐标下移(h-h1)个单位
    CGContextAddQuadCurveToPoint(context, w/2, h+(h-h1), w, h1);
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathFill);
}

@end
