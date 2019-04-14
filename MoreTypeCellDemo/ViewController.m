//
//  ViewController.m
//  MoreTypeCellDemo
//
//  Created by 小腊 on 2019/4/14.
//  Copyright © 2019 wxl. All rights reserved.
//

#import "ViewController.h"
#import "WXLHomeOneTableViewCell.h"
#import "WXLHomeTwoTableViewCell.h"
#import "WXLHomeThreeTableViewCell.h"

#import "WXLHomeOneModel.h"
#import "WXLHomeTwoModel.h"
#import "WXLHomeThreeModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *listArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 创建UITableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.tableHeaderView = [[UIView alloc] init];
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = 80;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    // 注册cell
    [self.tableView registerClass:[WXLHomeOneTableViewCell class] forCellReuseIdentifier:@"WXLHomeOneTableViewCellID"];
    [self.tableView registerClass:[WXLHomeTwoTableViewCell class] forCellReuseIdentifier:@"WXLHomeTwoTableViewCellID"];
    [self.tableView registerClass:[WXLHomeThreeTableViewCell class] forCellReuseIdentifier:@"WXLHomeThreeTableViewCellID"];
    // 配置假数据
    WXLHomeOneModel *oneModel = [[WXLHomeOneModel alloc] init];
    oneModel.name = @"第一个cell";
    oneModel.backColor = [UIColor redColor];
    
    WXLHomeTwoModel *twoModel = [[WXLHomeTwoModel alloc] init];
    twoModel.name = @"第二个cell";
    twoModel.backColor = [UIColor orangeColor];
    
    WXLHomeThreeModel *threeModel = [[WXLHomeThreeModel alloc] init];
    threeModel.name = @"第三个cell";
    threeModel.backColor = [UIColor greenColor];
    
    self.listArray = @[oneModel,twoModel,threeModel];
    
    [self.tableView reloadData];
    
    /*
     git地址 https://github.com/wangxiaola/MoreTypeCellDemo
     简书地址 
     */
}

#pragma mark ---- UITableViewDelegate ----
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<WXLPublicCellConfigProtocol>model = self.listArray[indexPath.row];
    return [model obtainHeightWithindexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id<WXLPublicCellConfigProtocol>model = self.listArray[indexPath.row];
    [model cellDidSelectRowAtIndexPath:indexPath other:nil];
}
#pragma mark ---- UITableViewDataSource ----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    id<WXLPublicCellConfigProtocol>model = self.listArray[indexPath.row];
    WXLHomePublicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[model obtainCellReuseIdentifier]];
    cell.cellConfig = model;
    return cell;
}


@end
