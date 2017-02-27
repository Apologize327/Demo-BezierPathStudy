//
//  TableViewController.m
//  Demo-贝塞尔曲线
//
//  Created by Suning on 16/10/21.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "TableViewController.h"
#import "MainViewController.h"
#import "BasicViewController.h"
#import "CurveViewController.h"
#import "SimpleTestController.h"
#import "UCViewController.h"

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
}

@property(nonatomic,strong) NSArray *dataArr;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"贝塞尔曲线";
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentify];
        cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    [self goToNextController:row];
}

-(void)goToNextController:(NSInteger) indexRow{
    switch (indexRow) {
        case 0:{
            BasicViewController *main = [[BasicViewController alloc]init];
            [self.navigationController pushViewController:main animated:YES];
            break;
        }
        case 1:{
            CurveViewController *main = [[CurveViewController alloc]init];
            [self.navigationController pushViewController:main animated:YES];
            break;
        }
        case 2:{
            MainViewController *main = [[MainViewController alloc]init];
            [self.navigationController pushViewController:main animated:YES];
            break;
        }
        case 3:{
            SimpleTestController *main = [[SimpleTestController alloc]init];
            [self.navigationController pushViewController:main animated:YES];
            break;
        }
        case 4:{
            UCViewController *main = [[UCViewController alloc]init];
            [self.navigationController pushViewController:main animated:YES];
            break;
        }
        default:
            break;
    }
}

-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray arrayWithObjects:@"基础入门",@"曲线",@"圆形动画",@"简单界面",@"仿UC首页", nil];
    }
    return _dataArr;
}

@end
