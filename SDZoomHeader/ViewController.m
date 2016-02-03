//
//  ViewController.m
//  SDZoomHeader
//
//  Created by DHSong on 16/2/2.
//  Copyright © 2016年 DHSong. All rights reserved.
//

#import "ViewController.h"
#import "SDZoomHeaderView.h"
#import "SecondViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, strong) SDZoomHeaderView *headerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataSource = @[@"北京",@"河北",@"天津",@"河南",@"广西",@"广东",@"湖南",@"湖北",@"山东",@"山西",@"陕西",@"新疆",@"西藏",@"青海",@"宁夏",@"福建",@"四川",@"成都",@"上海",@"浙江",@"江苏",@"江西",@"辽宁",@"黑龙江",@"吉林"];
    
    
    self.headerView = [[SDZoomHeaderView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
    self.headerView.imageView.image = [UIImage imageNamed:@"girl.jpg"];
    self.tableView.tableHeaderView = self.headerView;
    [self.tableView reloadData];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    [self presentViewController:nav animated:YES completion:nil];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    self.headerView.offsetY = offsetY;
    
}
@end
