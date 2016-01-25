//
//  FourthViewController.m
//  IT资讯
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *imgDatas;
@property (nonatomic, strong) NSArray *titleDatas;
@end

@implementation FourthViewController

-(void)loadImgDatas{
    _imgDatas = @[@"AS_share_icon_54px_8",@"AS_share_icon_54px_8",@"feedback-cs-avatar-icon",@"icon-76",@"AS_share_icon_54px_7"];
}
-(void)loadTitleDatas{
    _titleDatas = @[@"评论管理",@"帖子管理",@"我的收藏",@"主题",@"设置",@"推荐给朋友",@"关注IT资讯"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImgDatas];
    [self loadTitleDatas];
    // Do any additional setup after loading the view.
}
- (IBAction)imageBtnClick:(id)sender {
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return _titleDatas.count - 2;
    }else{
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    NSString *imgName = _imgDatas[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imgName];
    cell.textLabel.text = _titleDatas[indexPath.row];
    cell.accessoryType = UITableViewCellEditingStyleDelete;
    return cell;
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
