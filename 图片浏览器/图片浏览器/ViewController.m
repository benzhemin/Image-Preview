//
//  ViewController.m
//  图片浏览器
//
//  Created by zuo on 15/8/6.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "ViewController.h"
#import "ZXRPhotoCell.h"
#import "ZXRLineLayout.h"
#import "ZXRCircleLayout.h"

@interface ViewController () <UICollectionViewDataSource>
/** 图片数据 */
@property (nonatomic, strong)NSMutableArray *photos;
/** contentView */
@property (nonatomic, strong)UICollectionView *contentView;
@end

@implementation ViewController
static NSString *const CellIdentifier = @"cell";

#pragma mark - 懒加载
-(NSMutableArray *)photos
{
    if (_photos == nil) {
        _photos = [NSMutableArray array];
        for (int i = 1; i < 21; i++) {
            [_photos addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _photos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 0.设置
    ZXRLineLayout *layout = [[ZXRLineLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    
    
    // 1.创建
    CGFloat x = 0;
    CGFloat y = 200;
    CGFloat w = self.view.frame.size.width;
    CGFloat h = 200;
    UICollectionView *contentView = [[UICollectionView alloc] initWithFrame:CGRectMake(x, y, w, h) collectionViewLayout:layout];
    contentView.dataSource = self;
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
    [contentView registerNib:[UINib nibWithNibName:NSStringFromClass([ZXRPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.contentView.collectionViewLayout isKindOfClass:[ZXRLineLayout class]]) {
        [self.contentView setCollectionViewLayout:[[ZXRCircleLayout alloc] init] animated:YES];
    } else {
        ZXRLineLayout *layout = [[ZXRLineLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        [self.contentView setCollectionViewLayout:layout animated:YES];
    }
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZXRPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.ImageName = self.photos[indexPath.item];
    return cell;
}

@end
