//
//  WFSectionHeaderView.m
//  IT资讯
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WFSectionHeaderView.h"

@interface WFSectionHeaderView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation WFSectionHeaderView
static NSString *headerViewIdentifier = @"headerView";
+(instancetype)headerViewWithTableView:(UITableView *)tableView{
    WFSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headerView == nil) {
        headerView = [[WFSectionHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
    }
    return headerView;
}
//重写重用的初始化方法（添加子视图）
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
        [self.contentView addSubview:scrollView];
        _scrollView = scrollView;
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lol1.jpg"]];
//        imageView.frame = CGRectMake(0, 0, 375, 200);
//        [self.contentView addSubview:imageView];
        CGFloat imageW = scrollView.frame.size.width;
        CGFloat imageH = scrollView.frame.size.height;
        CGFloat imageY = 0;
        //添加图片
        for (int i = 0; i < 6; i ++) {
            //初始化
            UIImageView *imageView = [[UIImageView alloc] init];
            CGFloat imageX = imageW * i;
            //设置frame
            imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
            NSString *imgName = [NSString stringWithFormat:@"lol%d.jpg",i+1];
            imageView.image = [UIImage imageNamed:imgName];
            [scrollView addSubview:imageView];
        }
        //设置滚动范围
        CGFloat contentW = 6 *imageW;
        _scrollView.contentSize = CGSizeMake(contentW, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(250, 200 - 37, 100, 37)];
        [self.contentView addSubview:pageControl];
        _pageControl = pageControl;
        pageControl.numberOfPages = 6;
        pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        [self addTimer];
    }
    return self;
}
-(void)nextImage{
    int page = (int)self.pageControl.currentPage;
    if (page == 5) {
        page = 0;
    }else{
        page++;
    }
    //滚动scollView
    CGFloat x = page *self.scrollView.frame.size.width;
    self.scrollView.contentOffset = CGPointMake(x, 0);
}
//scollView滚动时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算页码
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    self.pageControl.currentPage = page;
}
//开始拖拽时调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self removeTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

//计时器
-(void)addTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

-(void)removeTimer{
    [_timer invalidate];
}



@end
