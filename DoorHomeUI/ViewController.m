//
//  ViewController.m
//  DoorHomeUI
//
//  Created by 连帅帅 on 2019/8/15.
//  Copyright © 2019 连帅帅. All rights reserved.
//

#import "ViewController.h"
#import "LSSTableView.h"
#import "Masonry.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)LSSTableView
*lss_tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildView];
}
//创建子试图
-(void)setUpChildView{
    //背景图（模拟滴滴的背景是地图）
    UIImageView *backImageView = [[UIImageView alloc]init];
    backImageView.userInteractionEnabled = YES;
    [self.view addSubview:backImageView];
    backImageView.image = [UIImage imageNamed:@"back"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didBackImage)];
    [backImageView addGestureRecognizer:tap];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.offset(0);
    }];
    //添加tabelview
    [self.view addSubview:self.lss_tableview];
    [self.lss_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.equalTo(self.mas_bottomLayoutGuideBottom);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row % 2 == 0) cell.backgroundColor = [UIColor redColor];
    else cell.backgroundColor = [UIColor blueColor];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld",indexPath.row);
}
-(void)didBackImage{
    NSLog(@"点击了背景视图");
}
-(LSSTableView *)lss_tableview{
    if (!_lss_tableview) {
        _lss_tableview = [[LSSTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _lss_tableview.estimatedRowHeight           = 0;
        _lss_tableview.estimatedSectionFooterHeight = 0;
        _lss_tableview.estimatedSectionHeaderHeight = 0;
        _lss_tableview.backgroundColor = [UIColor clearColor];
        _lss_tableview.delegate                     = self;
        _lss_tableview.dataSource                   = self;
        _lss_tableview.contentInset = UIEdgeInsetsMake(300, 0, 0, 0);
        _lss_tableview.contentOffset = CGPointMake(0, -300);
        _lss_tableview.showsVerticalScrollIndicator = NO;
        _lss_tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _lss_tableview;
}

@end
