//
//  UUHomeView.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/22.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUHomeView.h"
#import "UUHomeCollectionCell.h"

//屏幕宽度高度
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

static NSString * const kUUHomeCollectionCell = @"UUHomeCollectionCell";

@interface UUHomeView() < UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong, getter = getCollectionView) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation UUHomeView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self configUI];
    }
    
    return self;
}

- (void)configUI{

    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.collectionView];
}

#pragma mark - Collection View Data Source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 3;//_dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UUHomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kUUHomeCollectionCell forIndexPath:indexPath];
    
    [cell setContentWithObject:nil];
    
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


- (UICollectionView *)getCollectionView{
    
    if (!_collectionView) {
        
        _dataArray = [[NSMutableArray alloc] init];
        
        UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 60.0;//行间距(最小值)
        flowLayout.itemSize = CGSizeMake(ScreenHeight -120, ScreenHeight -120);//item的大小
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
//        _collectionView.backgroundColor = COLOR_WITH_RGB(235,235,235,1);
        
        [_collectionView registerClass:[UUHomeCollectionCell class] forCellWithReuseIdentifier:kUUHomeCollectionCell];
        
//        _collectionView.layer.borderWidth = 2;
//        _collectionView.layer.borderColor = [UIColor redColor].CGColor;
    }
    
    return _collectionView;
}


@end
