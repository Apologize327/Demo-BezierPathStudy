//
//  UCViewController.m
//  Demo-贝塞尔曲线
//
//  Created by Suning on 2017/2/24.
//  Copyright © 2017年 jf. All rights reserved.
//

#import "UCViewController.h"
#import "HeaderView.h"

#define kHeadViewHeight 150

@interface UCViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
}

@property(nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) HeaderView *headView;

@end

@implementation UCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setUpBackground];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

-(void)setUpBackground{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.alwaysBounceVertical = NO;
    [self.view addSubview:_tableView];
    
    UIView *tableHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeadViewHeight+15)];
    tableHeadView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = tableHeadView;
    [self.view addSubview:self.headView];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController popViewControllerAnimated:YES];
}

//控制headView的高度和位置
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGRect frame = self.headView.frame;
    if (offsetY < 0) {
        frame.size.height = kHeadViewHeight - offsetY;
        frame.origin.y = 0;
    } else {
        frame.size.height = kHeadViewHeight;
        frame.origin.y = -offsetY;
    }
    self.headView.frame = frame;
}

#pragma mark - setter/getter
-(NSArray *)dataArr{
    if (!_dataArr) {
        NSMutableArray *temp = [NSMutableArray array];
        for (NSInteger i=0; i<25; i++) {
            NSString *title = [NSString stringWithFormat:@"第%ld行",(long)i];
            [temp addObject:title];
        }
        _dataArr = [NSArray arrayWithArray:temp];
    }
    return _dataArr;
}

-(HeaderView *)headView{
    if (!_headView) {
        _headView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeadViewHeight)];
    }
    return _headView;
}

@end
