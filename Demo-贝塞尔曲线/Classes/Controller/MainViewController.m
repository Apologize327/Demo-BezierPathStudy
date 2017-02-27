//
//  MainViewController.m
//  Demo-贝塞尔曲线
//
//  Created by Sun on 16/3/8.
//
//

#import "MainViewController.h"

@interface MainViewController (){
    CAShapeLayer *_shapeLayerTest;
}

@property(nonatomic,strong) CABasicAnimation *anima;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawProcessCircle];
//    [self drawCircleTest];
}

/** 画圆形进度条 */
-(void)drawProcessCircle{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview:view];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = view.bounds;
    
    /**  
     *  bezierPathWithRect 根据一个矩形画曲线
     *  bezierPathWithOvalInRect 根据一个矩形的内切圆画曲线
     */
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:view.bounds];
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:view.bounds];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    [view.layer addSublayer:shapeLayer];
    
    [shapeLayer addAnimation:self.anima forKey:@"test"];
    _shapeLayerTest = shapeLayer;
}

/** 画一个实心圆形 */
-(void)drawCircleTest{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:view.bounds];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:view.bounds];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor redColor].CGColor;
    layer.strokeColor = [UIColor brownColor].CGColor;
    layer.lineWidth = 5.0f;
    [view.layer addSublayer:layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_shapeLayerTest addAnimation:self.anima forKey:@"test"];
}

-(CABasicAnimation *)anima{
    if (!_anima) {
        _anima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        _anima.duration = 3.0f;
        _anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _anima.fromValue = [NSNumber numberWithFloat:0.0f];
        _anima.toValue = [NSNumber numberWithFloat:1.0f];
        //动画结束后是否返回原位置
        _anima.fillMode = kCAFillModeForwards;
        _anima.removedOnCompletion = NO;
    }
    return _anima;
}

@end
