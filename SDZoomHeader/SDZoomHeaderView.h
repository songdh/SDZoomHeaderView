//
//  SDZoomHeaderView.h
//  SDZoomHeader
//
//  Created by DHsong on 16/2/2.
//  Copyright © 2016年 DHsong. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SDZoomHeaderView : UIView
@property (nonatomic, strong, readonly) UIImageView *imageView;

/**
 *  当界面滚动时将设置界面的偏移量
 */
@property (nonatomic, assign) CGFloat offsetY;

/**
 *  是否显示整张图片。图片尺寸可能比给出的区域大。这样下拉的时候，
    默认先按最大高度显示图片。当图片按高度全部展示完后，再等比拉伸图片
 */
@property (nonatomic, assign) BOOL isFullImage;
@end
