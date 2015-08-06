//
//  ZXRPhotoCell.m
//  图片浏览器
//
//  Created by zuo on 15/8/6.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "ZXRPhotoCell.h"

@interface ZXRPhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *PhotoImageView;

@end

@implementation ZXRPhotoCell

- (void)awakeFromNib {

    self.PhotoImageView.layer.borderWidth = 5;
    self.PhotoImageView.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)setImageName:(NSString *)ImageName
{
    _ImageName = [ImageName copy];
    
    self.PhotoImageView.image = [UIImage imageNamed:ImageName];
}

@end
