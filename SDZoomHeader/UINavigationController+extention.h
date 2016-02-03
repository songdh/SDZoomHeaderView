//
//  UINavigationController+extention.h
//  SDZoomHeader
//
//  Created by DHSong on 16/2/3.
//  Copyright © 2016年 DHSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (extention)
- (void)clearNavigationBar;
- (void)setTintColor:(nullable UIColor*)color;
- (void)setBarTintColor:(nullable UIColor*)color;
- (void)setBackgroundImage:(nullable UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setTitleColor:(nullable UIColor*)color;
@end
