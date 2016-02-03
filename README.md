# SDZoomHeaderView
1.如何添加
----------
使用的时候，将SDZoomHeaderView.h和SDZoomHeaderView.m导入到工程中。创建一个SDZoomHeaderView的对象，赋值给tableView的tableHeaderView就可以了。当然也可以自定义在其上面添加子view.
对于子view的布局目前还没有做，以后有时间再做吧

2.拉伸功能
----------
为tableView添加可拉伸的headerView。
ViewController.m中可以查看SDZoomHeaderView的使用方法：

      self.headerView = [[SDZoomHeaderView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
      self.headerView.imageView.image = [UIImage imageNamed:@"girl.jpg"];
      self.tableView.tableHeaderView = self.headerView;
      
如果需要根据图片高度来展示头部区域，可以设置isFullImage属性

      self.headerView.isFullImage = YES;
      
  一定要实现下面的方法
  
    -(void)scrollViewDidScroll:(UIScrollView *)scrollView
    {
      CGFloat offsetY = scrollView.contentOffset.y;
      self.headerView.offsetY = offsetY;
    }


3.navigationControllerBar
---------------------------
对于需要添加navigationBar的界面，添加了UINavigationController+extention类别，可在SecondViewController.h中查看使用方法

      //修改navigationBar
      [self.navigationController setTitleColor:[UIColor clearColor]];
      [self.navigationController clearNavigationBar];
      [self.navigationController setTintColor:[UIColor colorWithRed:0.001f green:0.102f blue:0.212f alpha:1.0f]];
      [self.navigationController setBarTintColor:[UIColor colorWithRed:0.239 green:0.491 blue:0.937 alpha:1.0f]];
      //以屏幕坐标原点为界面的坐标原点
      self.extendedLayoutIncludesOpaqueBars = YES;
      self.automaticallyAdjustsScrollViewInsets = NO;
      
  同样的，也需要实现下面的方法：
  
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
