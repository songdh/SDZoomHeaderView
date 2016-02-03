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
        self.backgroundColor = [UIColor blueColor];
        _originRect = self.bounds;
        
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.backgroundColor = [UIColor yellowColor];
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
    
    if (_isFullImage) {
        
        if (_offsetY < 0) {
            self.imageView.frame = CGRectMake(CGRectGetMinX(self.originRect), _offsetY, CGRectGetWidth(self.originRect), CGRectGetHeight(_originRect) - _offsetY);
        }else{
            self.imageView.frame = _originRect;
        }
    }else{

        if (_offsetY < 0) {
            CGFloat height = CGRectGetHeight(_originRect) - offsetY;
            CGFloat width = height * self.aspectRatio;
            self.imageView.frame = CGRectMake( (CGRectGetWidth(_originRect) - width)/2, _offsetY, width, height);
            
        }else{
            self.imageView.frame = _originRect;
        }
    }
}

@end
