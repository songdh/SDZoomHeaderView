//
//  SecondViewController.m
//  SDZoomHeader
//
//  Created by DHSong on 16/2/2.
//  Copyright © 2016年 DHSong. All rights reserved.
//

#import "SecondViewController.h"
#import "SDZoomHeaderView.h"
#import "UINavigationController+extention.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, strong) SDZoomHeaderView *headerView;
@property (nonatomic, strong) UIView *navigationBarView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataSource = @[@"北京",@"河北",@"天津",@"河南",@"广西",@"广东",@"湖南",@"湖北",@"山东",@"山西",@"陕西",@"新疆",@"西藏",@"青海",@"宁夏",@"福建",@"四川",@"成都",@"上海",@"浙江",@"江苏",@"江西",@"辽宁",@"黑龙江",@"吉林"];
    
    
    self.headerView = [[SDZoomHeaderView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
    self.headerView.imageView.image = [UIImage imageNamed:@"girl.jpg"];
    self.tableView.tableHeaderView = self.headerView;
    
    if (self.navigationController.childViewControllers.count == 1) {
        UIBarButtonItem *dismissBarButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(onDismiss:)];
        self.navigationItem.leftBarButtonItem = dismissBarButton;
    }
    
    //修改navigationBar
    [self.navigationController setTitleColor:[UIColor clearColor]];
    [self.navigationController clearNavigationBar];
    [self.navigationController setTintColor:[UIColor colorWithRed:0.001f green:0.102f blue:0.212f alpha:1.0f]];
    [self.navigationController setBarTintColor:[UIColor colorWithRed:0.239 green:0.491 blue:0.937 alpha:1.0f]];
    //以屏幕坐标原点为界面的坐标原点
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onDismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:screenBounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 45;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.dataSource[indexPath.row];
    SecondViewController *secondViewController = [[SecondViewController alloc]init];
    secondViewController.title = title;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    self.headerView.offsetY = offsetY;
    
    if (offsetY > 100) {
        [self.navigationController setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.navigationController setTitleColor:[UIColor whiteColor]];
    }else{
        [self.navigationController setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController setTitleColor:[UIColor clearColor]];
    }
    
}

@end
