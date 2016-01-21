//
//  WFScrolViewController.m
//  IT资讯
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WFScrollViewController.h"

@interface WFScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation WFScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    CGFloat imageW = scrollView.frame.size.width;
    CGFloat imageH = scrollView.frame.size.height;
    CGFloat imageY = 0;
    NSInteger imageCount = 6;
    //添加图片
    for (int i = 0; i < imageCount; i ++) {
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
    CGFloat contentW = imageCount *imageW;
    scrollView.contentSize = CGSizeMake(contentW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self addTimer];

    // Do any additional setup after loading the view.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
