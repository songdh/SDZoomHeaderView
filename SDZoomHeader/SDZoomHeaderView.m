//
//  SDZoomHeaderView.m
//  SDZoomHeader
//
//  Created by DHSong on 16/2/2.
//  Copyright © 2016年 DHSong. All rights reserved.
//

#import "SDZoomHeaderView.h"

@interface SDZoomHeaderView ()
@property (nonatomic, assign) CGFloat aspectRatio;//宽高比  width/height
@property (nonatomic, assign) CGRect originRect;//记录原始的rect
@end

@implementation SDZoomHeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
        _backgroundView.backgroundColor = self.backgroundColor;
        [self addSubview:_backgroundView];

        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
        
        self.aspectRatio = CGRectGetWidth(frame)/CGRectGetHeight(frame);
    }
    return self;
}

-(void)setOffsetY:(CGFloat)offsetY
{
    _offsetY = offsetY;
    
    if (_offsetY < 0) {
        if (_isFullImage) {
            self.imageView.frame = CGRectMake(CGRectGetMinX(self.imageView.frame),
                                              _offsetY+_imageViewEdgeInsets.top,
                                              CGRectGetWidth(self.bounds)-self.imageViewEdgeInsets.left-self.imageViewEdgeInsets.right,
                                              CGRectGetHeight(self.bounds)-self.imageViewEdgeInsets.top-self.imageViewEdgeInsets.bottom - _offsetY);
        }else{
            CGFloat height = CGRectGetHeight(self.bounds)-self.imageViewEdgeInsets.top-self.imageViewEdgeInsets.bottom - _offsetY;
            CGFloat width = height * self.aspectRatio;
            
            self.imageView.frame = CGRectMake((CGRectGetWidth(self.bounds)-width)/2, _offsetY+_imageViewEdgeInsets.top, width, height);
            
        }
    }
    
    self.backgroundView.frame = CGRectMake(0,
                                           CGRectGetMinY(self.imageView.frame)-_imageViewEdgeInsets.top,
                                           CGRectGetWidth(self.bounds),
                                           CGRectGetHeight(self.imageView.frame)+_imageViewEdgeInsets.bottom+_imageViewEdgeInsets.top);
}

-(void)setImageViewEdgeInsets:(UIEdgeInsets)imageViewEdgeInsets
{
    _imageViewEdgeInsets = imageViewEdgeInsets;
    CGRect rect = CGRectMake(_imageViewEdgeInsets.left, _imageViewEdgeInsets.top, CGRectGetWidth(self.bounds)-_imageViewEdgeInsets.left-_imageViewEdgeInsets.right, CGRectGetHeight(self.bounds)-_imageViewEdgeInsets.top-_imageViewEdgeInsets.bottom);
    self.imageView.frame = rect;
    self.aspectRatio = CGRectGetWidth(self.imageView.frame)/CGRectGetHeight(self.imageView.frame);
}

@end
