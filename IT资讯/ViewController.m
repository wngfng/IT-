//
//  ViewController.m
//  IT资讯
//
//  Created by qingyun on 16/1/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "WFModel.h"
#import "WFTableViewCell.h"
#import "WFSectionHeaderView.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *datas;
@end

@implementation ViewController
static NSString *secondIdentifier = @"cell2";
-(NSArray *)datas{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"meituan" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            WFModel *model = [WFModel modelWithDictionary:dict];
            [models addObject:model];
        }
        _datas = models;
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置数据源和代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    //注册
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WFTableViewCell class]) bundle:nil] forCellReuseIdentifier:secondIdentifier];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark _UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:secondIdentifier forIndexPath:indexPath];
    cell.model = self.datas[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WFSectionHeaderView *secondHeaderView = [WFSectionHeaderView headerViewWithTableView:tableView];
    return secondHeaderView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
